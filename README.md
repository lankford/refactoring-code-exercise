# About this refactor by Matt Lankford

If you go through the [Commits](https://github.com/lankford/refactoring-code-exercise/commits/master) , you will see that I have made most of the changes in the smallest "mental leap" as possible for most changes.

For the more complex bits, I created a Minitest file and made changes to it before moving them over to the "production code". Once the code was complete and the file no longer serving a purpose, it was removed.

Many of the changes consisted of turning non-rails validations into more conforming versions.

Some bugs were discovered along the way as well and are documented in the commit history.

# Assumptions Given

This exercise involves improving a fictional subset of a Ruby on Rails 5.x application.  It only contains a model, controller, and two views.

You should assume the technology stack used for this code includes:
* Ruby on Rails 5.x
* Ruby 2.3.x (MRI)
* PostgreSQL Database
* ERB
* jQuery
* Moment.js

## Instructions

Refactor and improve the code.  Add directories/files as needed.

You are not expected to run the code or make this work as a real Rails application.
