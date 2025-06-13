# GlassSphere

GlassSphere is a Ruby library which implements 
[Regression Test Selection mechanism][1] originally published by Aaron
Patterson.
Its main purpose is to select a minimal subset of your test suite which should
be run to ensure your changes didn't break anything.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'glass_sphere'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install glass_sphere

## Usage

Please see our [official documentation][2].

### Versioning

We use [semantic versioning][3] for our [releases][4].

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/rodrigovilina/glass_sphere.

## License

GlassSphere is released under the
[MIT License](https://opensource.org/licenses/MIT).

[1]: https://tenderlovemaking.com/2015/02/13/predicting-test-failues.html
[2]: https://rodrigovilina.github.io/glass_sphere/
[3]: https://semver.org/
[4]: https://github.com/rodrigovilina/glass_sphere/releases
