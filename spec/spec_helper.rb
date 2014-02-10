require_relative "../lib/marvell"

require 'minitest/autorun'
require "webmock/minitest"
require "vcr"

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/dish_cassettes'
  c.hook_into :webmock
end

# Moneky-patch time so that the md5 key is always the same
class Time
  def self.now
    Time.new("2014-02-09 20:24:26 -0600")
  end
end
