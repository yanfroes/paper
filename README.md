# README

This is a test app for testing paper_trail nested associations.

## Model structure

Book

- has_many authors through authorships
- has_many editions 
  - has_one cover
- has_one isbn

Person

- has_many books through authorships

## How to use

- Create a new Person.
- Create a new Book.
- Input Book data, save the Book.
- Edit the newly created Book, and save the Book.
- Click Versions of the Book.
- Click Restore to this version.

## Expected behavior

The Restore should be able to restore all associations, including edition cover.

## Current behavior

The Restore can restore all associations but the edition cover.

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
