# CommissionHub RAN

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'commission_hub_ran'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install commission_hub_ran

## Usage

### Rails

Create a `initializers/commission_hub.rb` with your affiliates configuration files

```ruby
CommissionHub.setup do |config|

  config.setup :rakuten_affiliate_network_v1 do |c|
    c.base_url  = 'https://api.rakutenmarketing.com'
    c.username  = 'user'
    c.password  = 'pass'
    c.scope     = '000111'
    c.client_id = 'client_id'
    c.authorization_basic_auth = 'Basic basic-pass'
  end

end


```
Example: Retrieving advertisers from Rakuten Affiliate Network

```ruby

# Get your JWT Token
@ran_connection = CommissionHub.initialize_connection(:rakuten_affiliate_network_v1)
auth_response = JSON.parse(@ran_connection.authorization.to_s)

# Authenticate against the API
@ran_connection = CommissionHub.initialize_connection(:rakuten_affiliate_network_v1, {authorization_bearer_token: "Bearer #{auth_response['access_token']}"} )

# Get all advertisers
response = @ran_connection.advertisers

# Get only approved advertisers
response = @ran_connection.advertisers "getMerchByStatus/approved"

# Use a block and/or a mapper
@ran_connection.advertisers "getMerchByStatus/approved", mapper: XML::Mapper do |advertisers|
  advertisers.each do |advertiser|
    Advertiser.create(name: advertiser_name)
  end
end

```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run
the tests. You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new
version, update the version number in `version.rb`, and then run `bundle exec rake release`, which
will create a git tag for the version, push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lemmoney/commission_hub.
This project is intended to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

