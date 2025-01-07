class PushEventProcessor
  def initialize(event)
    @event = event
  end

  def call
    commits_count = event["payload"]["commits"].size
    repo_name =  event["repo"]["name"]
    puts "- Pushed #{commits_count} commits to #{repo_name}"
  end

  private

  attr_reader :event
end
