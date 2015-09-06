# Heroku

## _What is it?_

Github only supports static front-end sites, so we need something more robust and scalable for our Rails apps.  Heroku has everything that we need for this:

- Dynos - run virtually any language
- Database - always postgres
- Tools and components
- Connects with heaps of other applications (Salesforce etc.)
- Good support

See [here](https://www.heroku.com/home) for more.

## _Steps for Deploying a Rails app to Heroku_

- Make an account - [here.](https://signup.heroku.com/www-header)
- Install the heroku toolbelt - see [here](https://toolbelt.heroku.com/) or use `brew install heroku`
- Make sure that it has worked
    + `heroku --version`
    + `which heroku`
- Log in - `heroku login`
- Make your Rails app
    + 'Deploy Early, Deploy Often'
    + Set the app up with PostgreSQL
        * `rails new app_name --database=postgresql`
        * `rails new app_name -d postgresql`
- Change into the app directory and run `bundle install` to install all Gems and dependencies
- At the end of the Gemfile, add this line - `gem 'rails_12factor', group: :production` and then run `bundle install` again
- Make it a git repository
    + Run `git init` in the root folder of the project
    + `git add .`, `git commit -m "Your commit message."`
    + Run `git status` to make sure everything has worked
- Run `heroku create`
- Run `git config --list | grep heroku` to make sure it has worked
- Run `git push heroku master`
- Run `heroku run rake db:migrate`
    + Any command prefixed by `heroku run` will obviously run on the heroku terminal
- Ensure that you have a running server, run `heroku ps:scale web=1`
- Run `heroku ps` to make sure that that has all worked
- Run `heroku open` to do exactly what you imagine

For this in far more detail, [see here.](https://devcenter.heroku.com/articles/getting-started-with-rails4)

## _Common Heroku Commands_

- `heroku run rake db:etc.` (create, seed, migrate etc.)
- `heroku run rails console`
- `heroku logs` - Shows the rails server (once off)
- `heroku logs --tail` - Shows the live server