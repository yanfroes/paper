# README

This is a test app for testing paper_trail nested associations.

## Model structure

Book

- has_many authors through authorships
- has_many editions 
  - has_one cover -> changed to has_many
- has_one isbn
- has_many covers -> added in order for the PT-AT gem to work

Edittion

- has_one cover -> changed to has_many

Person

- has_many books through authorships

## setup

1. `bundle install`
2. `rails db:create`
3. `rails db:migrate`
4. `rails db:seed` # optional, will create sample person

## How to use the app

- Create a new Person.
- Create a new Book.
- Input Book data, save the Book.
- Edit the created Book, change the cover value, then save the Book.
- Click Versions of the book.
- Click Restore to this version.

## Expected behavior

The Restore should be able to restore all associations, including edition cover.

## Current behavior

~~The Restore can restore all associations but the edition cover.~~

The Restore can now restore cover, too!

## Possible issue

The documentation for PT-AT [stated](https://github.com/westonganger/paper_trail-association_tracking#limitations):

> If you want to include nested associations simply add :through relationships to your model.

But no example is given.

## Specs

* Ruby version

2.7.2

* Database creation

rails db:create

* Database initialization

rails db:migrate

* How to run the test suite

No test suite yet

* Services (job queues, cache servers, search engines, etc.)

None

* Deployment instructions

This is not meant to be deployed
