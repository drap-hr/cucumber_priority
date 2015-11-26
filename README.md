cucumber_priority - overridable step definitions for Cucumber
=============================================================

[Cucumber](https://github.com/cucumber/cucumber-ruby) raises an error if more than one step definitions match a step.

This gem provides a way to mark step definitions as *overridable*, meaning that they can always be overshadowed by a more specific version without raising an error.


Examples
--------

### Marking step definitions as overridable

To mark a step definition as overridable, call `#overridable` on the definition object:

    Given /^there is a movie with a (.*?) tone$/ do
      ...
    end.overridable

    Given there is a movie with a funny tone do
      ...
    end

The following step will now **no longer raise `Cucumber::Ambiguous`**:

    Given there is a movie with a funny tone

If a step matches more than one non-overridable steps, Cucumber will still raise `Cucumber::Ambiguous`.


### Defining priorities

You can define priorities for overridable steps by passing an numeric `:priority` option to `#overridable:`

    Given /^there is a movie with a (.*?) tone$/ do
      ...
    end.overridable(priority: 1)

    Given /^there is a movie with a (sad|upbeat|disturbing) tone$/ do
      ...
    end.overridable(priority: 5)

A higher priority wins the match.

A non-overridable step will always win over an overridable step regardless of its priority.


Supported Cucumber versions
----------------------------

cucumber_priority is tested against Cucumber 1.2, 1.3 and 2.1.


Installation
------------

In your `Gemfile` say:

    gem 'cucumber_priority'

Now run `bundle install` and restart your server.


Development
-----------

- We run tests against several Cucumber versions.
- You can bundle all versions with `rake all:install`.
- You can run specs against all versions with `rake all:spec`.
See `spec/support/database.sample.yml` for an example.

If you would like to contribute:

- Fork the repository.
- Push your changes **with passing specs**.
- Send us a pull request.

I'm very eager to keep this gem leightweight and on topic. If you're unsure whether a change would make it into the gem  [talk to me beforehand](mailto:henning.koch@makandra.de).


Credits
-------

Henning Koch from [makandra](http://www.makandra.com/)
