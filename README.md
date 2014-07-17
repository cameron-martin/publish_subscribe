# PublishSubscribe

Simple Publish/Subscribe pattern for ruby objects. It is like ruby's Observable module, but uses channels.

Adding subscriptions is not thread-safe, but if anyone wants this just open an issue and I'll add it.

It adds a public message `subscribe`, and two private methods, `publish` and `subscriptions`,
and an instance variable, `@_subscriptions`, to classes that mix in this module.

## Installation

Add this line to your application's Gemfile:

    gem 'publish_subscribe'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install publish_subscribe

## Usage

```ruby
class Publisher
  include PublishSubscribe

  def publish_message
    publish :channel, :argument
  end
end

publisher = Publisher.new

publisher.subscribe :channel do |argument|
  puts argument
end

publisher.publish_message
# :argument
```

## Contributing

1. Fork it ( https://github.com/cameron-martin/publish_subscribe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
