module Marvell
  class Entity
    def initialize(json_result)
      @result = json_result
    end
    attr_reader :result

    def method_missing(method_name, *arguments, &block)
      attribute = result[method_name.to_s.camel_case]
      attribute ? attribute : super
    end

    private
  end
end
