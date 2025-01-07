require_relative "event_dispatcher"
require_relative "client"

username = ARGV[0]
events = Client.user_events(username)
EventDispatcher.new(events).call