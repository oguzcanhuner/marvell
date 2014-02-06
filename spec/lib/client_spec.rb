require_relative "../spec_helper"
require "pry"

describe Marvel::Client do
  describe "api functionality" do
    it "uses the HTTParty library" do
      Marvel::Client.must_include HTTParty
    end

    it "uses the correct base uri" do
      Marvel::Client.base_uri.must_equal "gateway.marvel.com"
    end
  end

  describe "authentication" do
    it "requires a public key and private key" do
      Marvel::Client.new(public_key: "07e4dc912806b1c5d1e51687095bca09", private_key: 'a97d276fe66678f07ec9150e3012d41160937b85').must_be_instance_of Marvel::Client
    end
  end

  describe ".character" do
    let(:client) { Marvel::Client.new(public_key: "07e4dc912806b1c5d1e51687095bca09", private_key: 'a97d276fe66678f07ec9150e3012d41160937b85')}

    it "given an id, returns a Marvel::Character object" do
      client.character(id: 1234).must_be_instance_of Marvel::Character
    end
  end
end
