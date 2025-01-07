require "net/http"
require "json"

module Client
  class << self
    def user_events(nickname)
      uri = URI("https://api.github.com/users/#{nickname}/events")
      body = Net::HTTP.get(uri)
      JSON.parse(body)
    end
  end
end
