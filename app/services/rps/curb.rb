require 'net/http'

module RPS
  class Curb
    def play
      do_request
    rescue StandardError
      raise Errors::GameApiError, "Oops. Curb doesn't want to play."
    end

    private

    def request_uri
      URI(Rails.application.credentials.curb_uri)
    end

    def do_request
      http = Net::HTTP.new(request_uri.host)
      http.read_timeout = 15
      http.open_timeout = 10

      req = Net::HTTP::Get.new(request_uri)
      response = http.request(req)

      JSON.parse(response.body)['body']
    end
  end
end
