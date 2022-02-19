# e-note full stack ruby on rails application

This a Ruby on Rails fullstack application with PostgreSQL. The goal of this app is to solve the problem of a workplace that needs to leave notes to communicate with each other.

# Software requirements

- Ruby 2.6.x
- Rails 6.1.4.4
- PostgreSQL
- graphicsmagick (this requires for Trix rich text editor to attach image)

# Installations

Assume that you already have the above software lists installed.
After git clone from this repo.

`bundle install`

Edit `config/database.yml` , then change the username and password of PostgreSQL as per your system.

`rails db:create`

`rails db:migrate`

`rails db:seed`

`rails s`
