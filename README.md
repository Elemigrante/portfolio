# Personal Portfolio Application

> This is a Ruby on Rails 5.2 application and uses Ruby 2.5.0 with PostgreSQL database.
> Also use Carrierwave for image uploads with connection to AWS S3 for file hosting.

### Features

- Real time chat engine for comments
- Blog
- Portfolio
- Drag and drop interface

### How to launch

1: Download or clone repository

2: Use bundler
```
$ bundle install
```

3: Create DataBase
```
$ bundle exec rails db:create
```

4: Run DataBase migrations
```
$ rails db:migrate
```

5: To populate database with seed data run. 
Seed file contains default values for admin and user
```
$ bundle exec rails db:seed
```
You can also use the command to overwrite DB from a seed file with default values
```
$ rails db:setup
```

6: To start Rails service, enter in command line
```
$ rails s
```

### How to use dotenv-rails for keeping AWS secret keys 

1: Use `gem 'dotenv-rails'` to store keys safely

2: Add `dotenv-rails` to the `:groups => [:development, :test]` and perform in the terminal `bundle install`

3: Using it is also not complicated: just set the environment variables in the file `.env` in the root of your project and specify the desired environment variables there:
```
#/my/rails/app/.env
export S3_BUCKET_NAME=bucket-name
export AWS_ACCESS_KEY_ID=EXAMPLEAWSACCESSKEYID
export AWS_SECRET_ACCESS_KEY=exampleawssecretaccesskey
export REGION=example_region
```
4: And now we can access our environment variables in the same way as in the previous example: `ENV ['AWS_ACCESS_KEY_ID']`, `ENV ['AWS_SECRET_ACCESS_KEY']`, `ENV ['S3_BUCKET_NAME']` and `ENV ['REGION']`. Naturally, do not forget to add our file `.env` in `.gitignore`, since the values in it are different for each developer.

### How to deploy on heroku

1: Signig up on Heroku
2: Install Heroku CLI.
For more information [click here](https://devcenter.heroku.com/articles/heroku-cli).
```
sudo snap install --classic heroku
```
3: Enter your Heroku credentials like email and password by using the command in terminal:
```
heroku login
```
4: Create application with unique name
```
heroku create app-name
```
5: Config heroku ENV keys, for each ENV keys that were added to the `.env` file do
```
heroku config:set S3_BUCKET_NAME=bucket-name
```
6: Declare ruby version in gemfile `ruby '2.x.x'` if it doesn't exist, then commit your changes.

7: From `master branch` push it on heroku
```
git push heroku master
 ```

### Problem solving with Devise.secret key error

1: Go to `application.rb` file and put line `config.secret_key_base = ENV["SECRET_KEY_BASE"]`
```ruby
module DevcampPortfolio
  class Application < Rails::Application
    config.load_defaults 5.2

    config.secret_key_base = ENV["SECRET_KEY_BASE"]
  
    config.generators.system_tests = nil
  end
end
```

2: In terminal window type to get secret key
```
rails secret
```
and then copy and paste in the SECRET_KEY_BASE= after equal sign
```
heroku config:set SECRET_KEY_BASE=herу
```

3: Just in case, it’s better to create `Procfile` in the root directory and add lines to it
```
web: bundle exec rails server -p $PORT
worker:  bundle exec rake jobs:work
```

4: Commit changes and push to your repository by following commands
```
git satus

git add .

git commit -m ' '

git push
```

5: Push on heroku
```
git push heroku master
```