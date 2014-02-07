require_relative "../lib/marvel"

require 'minitest/autorun'
#require "webmock/minitest"

#WebMock.disable_net_connect!

def fixture(name)
  fixture = IO.read("spec/fixtures/#{name}.json")
  JSON.parse(fixture)
end
