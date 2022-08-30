## Ruby on Rails template project

This is Rails template project with basic docker-compose Postgres container for development. Including User Devise model with sign in/sign up Grape API generating JWT, with user authentication by this JWT (check `app/modules/authenticate` folder). Also providing default Github CI including Rubocop and RSpec checks.

1. Set up your project database connection in `config/database.yml`
1. Check `migrate/` folder and create base migrations

Then you can start your project:
1. `bundle install` Install gems 
1. `docker-compose up` Run Docker containers
1. `rails db:create` Create database
1. `rails db:migrate` Run migrations
1. `rails s` Start Rails app

And also check rubocop and write tests:
1. `bundle exec rubocop -a` to run Rubocop
1. `foreman run --env .env.test bundle exec rspec -f doc` to run RSpec tests (check `/spec` folder)