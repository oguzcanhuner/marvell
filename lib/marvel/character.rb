module Marvel
  class Character
    def initialize(json_result)
      @result = json_result
    end
    attr_reader :result

    def method_missing(method_name, *arguments, &block)
      result = character[method_name.to_s]
      result ? result : super
    end

    private
    def character
      results = result.fetch("data").fetch("results")
      results.first
    end
  end
end
