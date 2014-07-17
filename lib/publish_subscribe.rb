module PublishSubscribe

  def subscribe(channel, &block)
    subscriptions.add(channel, block)
  end

  private

  def publish(channel, *args)
    subscriptions.get(channel).each do |proc|
      proc.call(*args)
    end
  end

  def subscriptions
    @_subscriptions ||= SubscriptionRegistry.new
  end

  class SubscriptionRegistry
    def initialize
      @subscriptions = {}
    end

    def add(channel, proc)
      (@subscriptions[channel] ||= []) << proc
    end

    def get(channel)
      @subscriptions[channel] || []
    end
  end

end