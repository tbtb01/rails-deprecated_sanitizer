# Rails::Deprecated::Sanitizer

In Rails 4.2 a new and more secure sanitization implementation option has been introduced.
It is the default implementation for new applications generated in Rails 4.2 and
all applications in Rails 5.

This gem includes the old behavior shipping with Rails 4.2 and before. It will be supported until Rails 5.

# Upgrading Your Application
To upgrade to the new behavior today, upgrade your Rails app to 4.2, add the `rails-html-sanitizer`
gem to your Gemfile, run `bundle` and you're all set.
Consult the Rails 4.2 upgrade guide for more information.

You can read more about the new sanitization implementation here: [rails-html-sanitizer](https://github.com/rails/rails-html-sanitizer).

# Reporting XSS Security Issues

The code provided here deals with XSS attacks and is therefore a security concern.
So if you find a security issue please follow the [regular security reporting guidelines](http://rubyonrails.org/security/).
