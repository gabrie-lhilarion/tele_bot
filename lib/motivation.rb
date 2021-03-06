require 'telegram/bot'
require 'net/http'
require 'json'

class Motivate
  @values = nil

  def initialize
    @values = make_the_request
  end

  def make_the_request
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    re = Net::HTTP.get(uri)
    response = JSON.parse(re)
    response
  end

  def select_random
    @values.sample
  end
end
