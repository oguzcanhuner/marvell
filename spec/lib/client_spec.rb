require_relative "../spec_helper"
require "pry"

describe Marvel::Client do
  let(:client) { Marvel::Client.new(public_key: "07e4dc912806b1c5d1e51687095bca09", private_key: 'a97d276fe66678f07ec9150e3012d41160937b85')}

  describe "api functionality" do
    it "uses the HTTParty library" do
      Marvel::Client.must_include HTTParty
    end

    it "uses the correct base uri" do
      Marvel::Client.base_uri.must_equal "http://gateway.marvel.com"
    end
  end

  describe "#character" do
    it "given an id, returns a Marvel::Character object" do
      Marvel::Client.stub :get, fixture('character') do
        character = client.character(id: 1009521)
        character.must_be_instance_of Marvel::Entity
        character.name.must_equal " Hank Pym"
      end
    end
  end

  describe "#characters" do
    it "returns an array of characters" do
      Marvel::Client.stub :get, fixture('characters') do
        characters = client.characters
        characters.must_be_instance_of Array
        characters.first.must_be_instance_of Marvel::Entity
      end
    end

    describe "filtering the resultset" do
      it "filters by limit" do
        Marvel::Client.stub :get, fixture('characters') do
          characters = client.characters(limit: 2)
          characters.size.must_equal 2
        end
      end
    end
  end

  describe "#comic" do
    it "given an id, returns a Marvel::Comic object" do
      Marvel::Client.stub :get, fixture('comic') do
        comic = client.comic(id: 41530)
        comic.must_be_instance_of Marvel::Entity
      end
    end
  end

  describe "#comics" do
    it "returns an array of comics" do
      Marvel::Client.stub :get, fixture('comics') do
        comics = client.comics
        comics.must_be_instance_of Array
        comics.first.must_be_instance_of Marvel::Entity
      end
    end

    describe "filtering the resultset" do
      it "filters by limit" do
        Marvel::Client.stub :get, fixture('comics') do
          comics = client.comics(limit: 2)
          comics.size.must_equal 2
        end
      end
    end
  end
end
