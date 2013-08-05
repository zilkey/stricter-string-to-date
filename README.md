# Stricter::String::To::Date

ActiveSupport 4.0 changed `String#to_date` to raise a more descriptive error for invalid dates.

It also makes date parsing more liberal than ActiveSupport 3.x.

```ruby
# ActiveSupport 3.x
"asdf".to_date # => NoMethodError: undefined method `div' for nil:NilClass
"333".to_date # => NoMethodError: undefined method `div' for nil:NilClass

# ActiveSupport 4.x
"asdf".to_date # => ArgumentError: invalid date
"333".to_date # => Fri, 29 Nov 2013
```

You can install this gem if you:

 * Rely on the old 3.x behavior and want to upgrade to ActiveSupport 4.x without dealing with it yet
 * Are on 3.x and want to see deprecation warnings about the changes that will come in 4.x

## Installation

Add this line to your application's Gemfile:

    gem 'stricter-string-to-date'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stricter-string-to-date
