require_relative "character"
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
      result = self.class.get("/v1/public/characters/#{params[:id]}", query: auth_params)
      character = Marvel::JsonParser.parse_result_set(result).first
      Marvel::Character.new(character)
    end

    def characters(params: {})
      result = self.class.get("/v1/public/characters?limit=1", query: auth_params)
      characters = Marvel::JsonParser.parse_result_set(result)
      characters.collect do |character|
        Marvel::Character.new(character)
      end
    end

    private

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
