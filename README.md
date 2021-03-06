[![Build Status](https://travis-ci.org/apiology/quality.png)](https://travis-ci.org/apiology/quality)
[![Coverage Status](https://coveralls.io/repos/apiology/quality/badge.png?branch=master)](https://coveralls.io/r/apiology/quality?branch=master)


# Quality -- code quality ratchet for Ruby

##Overview

Quality is a tool that runs quality checks on Ruby code using cane,
reek, flog, flay and rubocop and makes sure your numbers don't get any
worse over time.

```bash
$ gem install quality
```

or in your Gemfile:

```ruby
group :development do
  gem 'quality'
end
```
and then:

```bash
$ bundle install
```

Once you have the gem, configure your Rakefile like this:

```ruby
require 'quality/rake/task'

Quality::Rake::Task.new
```

Then run:

```bash
$ rake quality
```

If you want to ratchet up the quality and force yourself to improve
code, run:

```bash
$ rake ratchet
```

## Configuration options

```ruby
Quality::Rake::Task.new { |t|
  # Name of quality task.
  # Defaults to :quality.
  t.quality_name = "quality"

  # Name of ratchet task.
  # Defaults to :ratchet.
  t.ratchet_name = "ratchet"

  # Array of strings describing tools to be skipped--e.g., ["cane"]
  #
  # Defaults to []
  t.skip_tools = []

  # Array of directory names which contain ruby files to analyze.
  #
  # Defaults to %w{app lib test spec feature}, which translates to *.rb in the base directory, as well as those directories.
  t.ruby_dirs = %w{app lib test spec feature}

  # Relative path to output directory where *_high_water_mark
  # files will be read/written
  #
  # Defaults to 'metrics'
  t.output_dir = 'metrics'
}
```

## Why

See [this post for more information](http://blog.apiology.cc/2014/06/scalable-quality-part-1.html) on the problem the quality gem solves.

## Maturity

Quality is rapidly evolving, but uses [semantic versioning](http://semver.org/)--any incompatible changes will come out as major number updates.

## Supported Ruby Versions

Tested against Ruby 1.9.3 and 2.1.2.  Feel free to submit issues if problems are found elsewhere.

## Contributing

* Fork the repo
* Create a feature branch
* Submit a github pull request

Many thanks to all contributors, especially [@andyw8](https://github.com/andyw8), who has contributed some great improvements.

### Dependencies

Quality makes use of the following other gems, which do the actual checking:

* [reek](https://github.com/troessner/reek)
* [cane](https://github.com/square/cane)
* [flog](https://github.com/seattlerb/flog)
* [flay](https://github.com/seattlerb/flay)
* [rubocop](https://github.com/bbatsov/rubocop)

### Learn More

* Browse the code or install the latest development version from [https://github.com/apiology/quality/tree](https://github.com/apiology/quality/tree)

## License

Licensed under the MIT license.
