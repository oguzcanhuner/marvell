module Marvel
  class Character
    def initialize(json_result)
      @result = json_result
    end
    attr_reader :result

    def method_missing(method_name, *arguments, &block)
      attribute = result[method_name.to_s]
      attribute ? attribute : super
    end
  end
end
