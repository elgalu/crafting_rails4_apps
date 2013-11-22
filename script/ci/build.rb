#!/usr/bin/env ruby

IGNORE_DIRS = ['script']

dirs = Dir['*'].select {|d| File.directory?(d)} - IGNORE_DIRS
dirs = dirs.map { |d| File.expand_path(d) }

dirs.each do |d|

  # Only run live_assets test in just 1 platform to avoid concurrency issues
  perform_test = !(d =~ /live_assets/) || (RUBY_ENGINE == 'ruby' && RUBY_VERSION == '2.0.0')
  next unless perform_test

  abort "Failed to bundle install on #{d}\n" unless system <<-BASH
    cd #{d} && pwd
    bundle update
  BASH

  test_dummy = File.join(d, 'test/dummy')

  if File.exists?(test_dummy)
    abort "Failed to create and migrate databases on #{test_dummy}\n" unless system <<-BASH
      cd #{test_dummy} && pwd
      mkdir -p db
      bundle exec rake db:create
      bundle exec rake db:migrate
    BASH
  end

  abort "Failed tests on #{d}\n" unless system <<-BASH
    cd #{d} && pwd
    bundle exec rake
  BASH

end
