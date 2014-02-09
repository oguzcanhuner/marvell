module Marvell
  class JsonParser
    def self.parse_result_set(json)
      json.fetch("data").fetch("results")
    end
  end
end
