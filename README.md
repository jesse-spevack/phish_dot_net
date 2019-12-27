# Phish_Dot_Net

Welcome to the `Phish_Dot_Net` gem, an [Phish.Net](https://phishnet.api-docs.io/v3/the-phish-net-api/welcome) API wrapper for folks who love the magic of Ruby and Phish.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'phish_dot_net'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phish_dot_net

## Usage

## Setup Environment Variables

Update the development environment with your [PHISH_DOT_NET_API_KEY](http://api.phish.net/keys/), for example:

```bash
echo "export PHISH_DOT_NET_API_KEY='YOUR_API_KEY'" > phish_dot_net.env
echo "phish_dot_net.env" >> .gitignore
source ./phish_dot_net.env
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PlanetEfficacy/phish_dot_net.

## Upcoming Features
Features to implement include:
[ ] * Finsihing Attendance testing and implementation
[ ] * Abstracting common code
- Implement remaining API methods:
  * [ ] [Authority](https://phishnet.api-docs.io/v3/authority/authority-get)
  * [ ] [Blog](https://phishnet.api-docs.io/v3/blog/blog-get)
  * [ ] [Collections](https://phishnet.api-docs.io/v3/collections/collection-query)
  * [ ] [Jamcharts](https://phishnet.api-docs.io/v3/jamcharts/jamcharts-all)
  * [ ] [People](https://phishnet.api-docs.io/v3/people/people-get)
  * [ ] [Relationships](https://phishnet.api-docs.io/v3/relationships/get-friends-and-fans)
  * [ ] [Reviews](https://phishnet.api-docs.io/v3/reviews/get-a-review)
  * [ ] [Setlists](https://phishnet.api-docs.io/v3/setlists/get-the-most-recent-setlist)
  * [ ] [Shows](https://phishnet.api-docs.io/v3/shows/get-show-links)
  * [ ] [User](https://phishnet.api-docs.io/v3/user/get-user-details)
  * [ ] [Venues](https://phishnet.api-docs.io/v3/venues/get-all-venues)


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
