#!/usr/bin/env ruby

dirs = Dir['*'].select {|d| File.directory?(d)} - ['bin']
dirs = dirs.map { |d| File.expand_path(d) }

dirs.each do |d|

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

  # Only run live_assets test in 1 case to avoid concurrency issues
  unless d =~ /live_assets/ && RUBY_ENGINE != 'rbx'
    abort "Failed tests on #{d}\n" unless system <<-BASH
      cd #{d} && pwd
      bundle exec rake
    BASH
  end

end
