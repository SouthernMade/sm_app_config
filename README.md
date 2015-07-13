# SmAppConfig

SmAppConfig (Southern Made App Config) is a framework agnostic library for storing and retrieving configuration settings using a YAML file or ENV variables. SmAppConfig will look first for an ENV variable with the specified name, then fall back to the YAML file if one is not found. Configuration files are excluded from source control by default. See below for usage instructions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sm_app_config'
```

And then run:

    $ bundle

Or install it yourself as:

    $ gem install sm_app_config

Run the generator to create configuration files:

    $ app_config install

Or with --no-rails if your app does not use Rails:

    $ app_congfig install --no-rails

This will do the following:

- Create a configuration file at `config/app_config.yml`
- Create an example configuration file at `config/app_config.example.yml`
- Add `config/app_config.yml` to your `.gitignore` file

## Usage

To add configuration settings, simply add key/value pairs to `app_config.yml`, which is located in `config/` by default. If you are using Rails, you should place them under each applicable environment namespace. You should also add the keys with placeholder values to `app_config.example.yml`. This file should be checked into source control so that other developers know what keys need to be present in `app_config.yml`.

You also have the option to store your configuration settings in ENV variables. This would be the desired approach if you were deploying to Heroku. Regardless of how your settings are stored, they can be accessed in this way:

```ruby
AppConfig['my-setting']
```

If an ENV variable named MY-SETTING is not found, SmAppConfig will look in `app_config.yml` for a key named my-setting. If you are using Rails, it will look for the key under the appropriate environment namespace. An error will be raised if the setting is not found or if `app_config.yml` does not exist.

If you change `app_config.yml`, be sure to run:

```ruby
AppConfig.reload!
```

You can customize the name and location of your configuration file:

```ruby
SmAppConfig.configure(path: "custom/app_config.yml")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it (https://github.com/SouthernMade/sm_app_config/fork)
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Write tests for your feature, or regression tests highlighting a bug
4. Write the feature itself, or fix the bug
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push the branch (`git push origin feature/my-new-feature`)
7. Create a new Pull Request

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

