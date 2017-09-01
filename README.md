# ShapeShift API Wrapper

A ruby wrapper for the [shapshift.io API](https://shapeshift.io)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shapeshift_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shapeshift_ruby

## Usage

```ruby
require 'shapeshift_ruby'
client = ShapeShiftRuby::Client.new
client.rate(pair: 'btc_ltc')
=> {"pair"=>"btc_ltc", "rate"=>"59.50746268"}
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iamkidjoe/shapeshift-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

