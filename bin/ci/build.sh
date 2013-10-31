#!/bin/bash

set -e

cd pdf_renderer && pwd
bundle install
cd test/dummy && pwd
mkdir -p db
bundle exec rake db:create
bundle exec rake db:migrate
cd ../.. && pwd
bundle exec rake

cd ../mail_form && pwd
bundle install
cd test/dummy && pwd
mkdir -p db
bundle exec rake db:create
bundle exec rake db:migrate
cd ../.. && pwd
bundle exec rake

cd ../templater && pwd
bundle install
bundle exec rake

cd ../handlers && pwd
bundle install
cd test/dummy && pwd
mkdir -p db
bundle exec rake db:create
bundle exec rake db:migrate
cd ../.. && pwd
bundle exec rake

cd ../live_assets && pwd
bundle install
cd test/dummy && pwd
mkdir -p db
bundle exec rake db:create
bundle exec rake db:migrate
cd ../.. && pwd
# Only run live_assets test in 1 case to avoid concurrency issues
if [[ $RUBY_VERSION == "rbx-2.1.1" ]]; then
  bundle exec rake;
fi
