require "httparty"
require "digest/md5"

module Marvel
  class Client
    include HTTParty
    base_uri "gateway.marvel.com"

    def initialize(params)
      @public_key = params[:public_key]
      @private_key = params[:private_key]
    end
    attr_reader :public_key, :private_key

    # Takes a character ID
    def character(params)
      characters(id: params[:id]).first
    end

    def characters(params = {})
      get_and_parse_collection "characters", params
    end

    def comic(params)
      comics(id: params[:id]).first
    end

    def comics(params = {})
      get_and_parse_collection "comics", params
    end

    def creator(params)
      creators(id: params[:id]).first
    end

    def creators(params = {})
      get_and_parse_collection "creators", params
    end

    private

    def get_and_parse_collection(name, params)
      url = "/v1/public/#{name}"
      url += "/#{params.delete(:id)}" if params[:id]

      result = self.class.get(url, query: auth_params.merge(params))
      parse_collection(result)
    end

    def parse_collection(result)
      entities = Marvel::JsonParser.parse_result_set(result)
      entities.collect do |entity|
        Marvel::Entity.new(entity)
      end
    end

    def auth_params
      timestamp = 1
      hash = auth_hash(ts: timestamp)
      return {ts: timestamp, apikey: public_key, hash: hash}
    end

    def auth_hash(params)
      value = params[:ts].to_s+private_key.to_s+public_key.to_s
      Digest::MD5.hexdigest(value)
    end
  end
end
