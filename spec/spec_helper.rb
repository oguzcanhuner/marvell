require_relative "../lib/marvell"

require 'minitest/autorun'
require "webmock/minitest"
require "vcr"

#WebMock.allow_net_connect!

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/dish_cassettes'
  c.hook_into :webmock
end
