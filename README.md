# Tungsten::RVM

RVM for Tungsten

## Installation

Add this line to your `application's Gemfile:`

```ruby
gem 'tungsten-rvm'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tungsten-rvm

## Usage

Add this line to your Tungsten config:

```ruby
# config/tungsten.rb
require 'tungsten/rvm'
```

Now you can include it in your roles:

```ruby
# config/tungsten.rb
role :app do
  uses :rvm
end
```

## Development

Fork and install all dependencies:

    $ bundle

Test the lib locally with *Vagrant* using the provided `Vagrantfile`:

    $ vagrant up

Start sending commands:

    $ tungsten up -C lib/tungsten/rvm/test_config.rb

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/appmeup/tungsten-rvm. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
