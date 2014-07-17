require 'spec_helper'

describe PublishSubscribe do

  class Publisher
    include PublishSubscribe

    def publish_message
      publish :channel, :argument
    end
  end

  let(:publisher) { Publisher.new }

  it 'allows subscriptions' do
    expect { publisher.subscribe(:channel) {  } }.to_not raise_error
  end

  it 'sends messages to listeners' do
    listener1 = ->() { }
    listener2 = ->() { }

    allow(listener1).to receive(:call)
    allow(listener2).to receive(:call)

    publisher.subscribe(:channel, &listener1)
    publisher.subscribe(:channel, &listener2)
    publisher.publish_message

    expect(listener1).to have_received(:call).with(:argument)
    expect(listener2).to have_received(:call).with(:argument)
  end

end