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

    def character(params)
      id = params[:id]
      result = self.class.get("/v1/public/characters/#{id}", query: auth_params)
      Marvel::Character.new(result)
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
