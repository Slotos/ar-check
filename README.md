# AR::PGConstraint

[![Travis-CI](https://travis-ci.org/Slotos/ar-pgconstraint.png)](https://travis-ci.org/Slotos/ar-pgconstraint)
[![Code Climate](https://codeclimate.com/github/Slotos/ar-pgconstraint/badges/gpa.svg)](https://codeclimate.com/github/Slotos/ar-pgconstraint)
[![Test Coverage](https://codeclimate.com/github/Slotos/ar-pgconstraint/badges/coverage.svg)](https://codeclimate.com/github/Slotos/ar-pgconstraint/coverage)
<!--[![Gem](https://img.shields.io/gem/v/ar-pgconstraint.svg)](https://rubygems.org/gems/ar-pgconstraint)
[![Gem](https://img.shields.io/gem/dt/ar-pgconstraint.svg)](https://rubygems.org/gems/ar-pgconstraint)-->

Enable PostgreSQL's CHECK and EXCLUDE constraints on ActiveRecord migrations.

This is a work in progress, gem will be published once EXCLUDE constraint is implemented and additional tests are added.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "ar-pgconstraint"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ar-pgconstraint

## Usage

To create a `CHECK` constraint, just use the method `add_check`.

```ruby
create_table :employees do |t|
  t.integer :salary, null: false
end

add_check :employees, :positive_salary, "salary > 0"
```

This will generate a new constraint using the following SQL statement:

```sql
ALTER TABLE employees
ADD CONSTRAINT positive_salary_on_things
CHECK (salary > 0)
```

To remove it, just using `remove_check`.

```ruby
remove_check :employees, :positive_salary
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Slotos/ar-pgconstraint.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

