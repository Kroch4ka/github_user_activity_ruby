require "ostruct"

class CreateEventProcessor
  def initialize(event)
    @event = event
  end

  def call
    poro_event = build_poro_event
    case poro_event.ref_type
    when "repository"
      puts "- Created repository #{poro_event.repo_name}"
    when "branch"
      puts "- Created branch #{poro_event.ref}"
    end
  end

  private

  attr_reader :event

  def build_poro_event
    OpenStruct.new(
      ref_type: event["payload"]["ref_type"], 
      ref: event["payload"]["ref"], 
      repo_name: event["repo"]["name"]
    )
  end
end
