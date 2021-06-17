# README
### quizAPI apiKey=CsC8hCmPMmez5RP1DAypWVyF8Vanh40B3aUonBwm
### Heroku deployment url = https://quiz-app-79.herokuapp.com/
### Heroku deployment logs 
Enumerating objects: 15, done.
Counting objects: 100% (15/15), done.
Delta compression using up to 12 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 631 bytes | 631.00 KiB/s, done.
Total 8 (delta 6), reused 0 (delta 0), pack-reused 0
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Building on the Heroku-20 stack
remote: -----> Using buildpack: heroku/ruby
remote: -----> Ruby app detected
remote: -----> Installing bundler 2.2.16
remote: -----> Removing BUNDLED WITH version in the Gemfile.lock
remote: -----> Compiling Ruby/Rails
remote: -----> Using Ruby version: ruby-2.7.3
remote: -----> Installing dependencies using bundler 2.2.16
remote:        Running: BUNDLE_WITHOUT='development:test' BUNDLE_PATH=vendor/bundle BUNDLE_BIN=vendor/bundle/bin BUNDLE_DEPLOYMENT=1 bundle install -j4
remote:        Using rake 13.0.3
remote:        Using concurrent-ruby 1.1.9
remote:        Using i18n 1.8.10
remote:        Using minitest 5.14.4
remote:        Using thread_safe 0.3.6
remote:        Using tzinfo 1.2.9
remote:        Using activesupport 5.2.6
remote:        Using builder 3.2.4
remote:        Using erubi 1.10.0
remote:        Using racc 1.5.2
remote:        Using nokogiri 1.11.7 (x86_64-linux)
remote:        Using rails-dom-testing 2.0.3
remote:        Using crass 1.0.6
remote:        Using loofah 2.10.0
remote:        Using rails-html-sanitizer 1.3.0
remote:        Using actionview 5.2.6
remote:        Using rack 2.2.3
remote:        Using rack-test 1.1.0
remote:        Using actionpack 5.2.6
remote:        Using nio4r 2.5.7
remote:        Using websocket-extensions 0.1.5
remote:        Using websocket-driver 0.7.5
remote:        Using actioncable 5.2.6
remote:        Using globalid 0.4.2
remote:        Using activejob 5.2.6
remote:        Using mini_mime 1.1.0
remote:        Using mail 2.7.1
remote:        Using actionmailer 5.2.6
remote:        Using activemodel 5.2.6
remote:        Using arel 9.0.0
remote:        Using activerecord 5.2.6
remote:        Using marcel 1.0.1
remote:        Using activestorage 5.2.6
remote:        Using msgpack 1.4.2
remote:        Using bootsnap 1.7.5
remote:        Using bundler 2.2.16
remote:        Using coffee-script-source 1.12.2
remote:        Using execjs 2.8.1
remote:        Using coffee-script 2.4.1
remote:        Using method_source 1.0.0
remote:        Using thor 1.1.0
remote:        Using railties 5.2.6
remote:        Using coffee-rails 4.2.2
remote:        Using ffi 1.15.3
remote:        Using jbuilder 2.11.2
remote:        Using pg 1.2.3
remote:        Using puma 3.12.6
remote:        Using sprockets 3.7.2
remote:        Using sprockets-rails 3.2.2
remote:        Using rails 5.2.6
remote:        Using rb-fsevent 0.11.0
remote:        Using rb-inotify 0.10.1
remote:        Using sass-listen 4.0.0
remote:        Using sass 3.7.4
remote:        Using tilt 2.0.10
remote:        Using sass-rails 5.1.0
remote:        Using turbolinks-source 5.2.0
remote:        Using turbolinks 5.2.1
remote:        Using uglifier 4.2.0
remote:        Bundle complete! 19 Gemfile dependencies, 59 gems now installed.
remote:        Gems in the groups 'development' and 'test' were not installed.
remote:        Bundled gems are installed into `./vendor/bundle`
remote:        Bundle completed (0.50s)
remote:        Cleaning up the bundler cache.
remote: -----> Installing node-v12.16.2-linux-x64
remote: -----> Detecting rake tasks
remote: -----> Preparing app for Rails asset pipeline
remote:        Running: rake assets:precompile
remote:        Yarn executable was not detected in the system.
remote:        Download Yarn at https://yarnpkg.com/en/docs/install
remote:        Asset precompilation completed (1.33s)
remote:        Cleaning assets
remote:        Running: rake assets:clean
remote: -----> Detecting rails configuration
remote:
remote: ###### WARNING:
remote:
remote:        No Procfile detected, using the default web server.
remote:        We recommend explicitly declaring how to boot your server process via a Procfile.
remote:        https://devcenter.heroku.com/articles/ruby-default-web-server
remote:
remote:
remote: -----> Discovering process types
remote:        Procfile declares types     -> (none)
remote:        Default types for buildpack -> console, rake, web
remote:
remote: -----> Compressing...
remote:        Done: 49.3M
remote: -----> Launching...
remote:        Released v12
remote:        https://quiz-app-79.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/quiz-app-79.git
   560325b..f10f092  main -> main
