# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



* Procedure to use this Application


Step 1 - Versions Required to run this application
        Rails Version - 6.1.7.4
        JRuby Version - jruby-9.3.3.0 
        OpenJDK Version - 16.0.1+9

Step 2 - Dependencies added in gemfile
1. 'rspec-rails' used for RSpec test cases
2. 'simplecov' used for checking of coverage of test cases files
3. 'dotenv-rails' to fetch the private keys from .env file
4. 'bcrypt' used for password authentication
5. 'httparty' used for API call

Step 3 - Run this command to install all dependencies
1. bundle install

Start the server
1. rails s
2. url -  http://127.0.0.1:3000/

I have added the Main Page path to above url so it will open index.html.erb of common folder view.
 
index.html.erb of common folder view Has two links 
1. Sign Up - will take us to sign up form
2. Login -  will take us to login

After Signing up or logging into the application

It will redirect us to index.html.erb of weather folder view, where we can search for city and get the weather updates.