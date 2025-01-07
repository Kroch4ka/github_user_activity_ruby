require_relative "push_event_processor"
require_relative "create_event_processor"

class EventDispatcher
  def initialize(events)
    @events = events
  end

  def call
    puts "Output:"
    events.each do |event|
      case event["type"]
      when "PushEvent" then PushEventProcessor.new(event).call
      when "CreateEvent" then CreateEventProcessor.new(event).call
      else puts "- Unsupported event type"
      end
    end
  end

  private

  attr_reader :events
end
