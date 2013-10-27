#!/bin/sh

cd pdf_renderer/1_prawn && pwd
bundle install
cd test/dummy && pwd
mkdir -p db
bundle exec rake db:create
bundle exec rake db:migrate
cd ../.. && pwd
bundle exec rake
cd ../../mail_form && pwd
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
bundle exec rake
