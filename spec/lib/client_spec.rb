require_relative "../spec_helper"

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
    before { VCR.insert_cassette 'character', record: :new_episodes }
    after { VCR.eject_cassette }

    it "given an id, returns a Marvel::Character object" do
      character = client.character(id: 1009521)
      character.must_be_instance_of Marvel::Entity
      character.name.must_equal " Hank Pym"
    end
  end

  describe "#characters" do
    before { VCR.insert_cassette 'characters', record: :new_episodes }
    after { VCR.eject_cassette }

    it "returns an array of characters" do
      characters = client.characters
      characters.must_be_instance_of Array
      characters.first.must_be_instance_of Marvel::Entity
    end

    describe "filtering the resultset" do

      it "filters by limit" do
        VCR.insert_cassette 'characters_limited', record: :new_episodes
        characters = client.characters(limit: 4)
        characters.size.must_equal 4
        VCR.eject_cassette
      end

      it "filters by name" do
        VCR.insert_cassette 'characters_by_name', record: :new_episodes
        characters = client.characters(name: 'Spider-Man')
        characters.first.name.must_equal "Spider-Man"
        VCR.eject_cassette
      end
    end
  end

  describe "#comic" do
    before { VCR.insert_cassette 'comic', record: :new_episodes }
    after { VCR.eject_cassette }

    it "given an id, returns a Marvel::Entity object" do
      comic = client.comic(id: 41530)
      comic.must_be_instance_of Marvel::Entity
    end
  end

  describe "#comics" do
    it "returns an array of comics" do
      VCR.insert_cassette 'comics', record: :new_episodes
      comics = client.comics
      comics.must_be_instance_of Array
      comics.first.must_be_instance_of Marvel::Entity
      VCR.eject_cassette
    end

    describe "filtering the resultset" do
      after { VCR.eject_cassette }

      it "filters by limit" do
        VCR.insert_cassette 'comics_limited', record: :new_episodes
        comics = client.comics(limit: 4)
        comics.size.must_equal 4
      end

      it "filters by format" do
        VCR.insert_cassette 'comics_by_format', record: :new_episodes
        comics = client.comics(format: 'digital comic')
        comics.first.format.must_equal 'Digital Comic'
      end
    end
  end

  describe '#creator' do
    it "given an id, returns a Marvel::Entity object" do
      VCR.insert_cassette 'creator', record: :new_episodes
      creator = client.creator(id: 546)
      creator.must_be_instance_of Marvel::Entity
      VCR.eject_cassette
    end
  end

  describe '#creators' do
    it 'returns an array of creators' do
      VCR.insert_cassette 'creators', record: :new_episodes
      creators = client.creators
      creators.must_be_instance_of Array
      creators.first.must_be_instance_of Marvel::Entity
      VCR.eject_cassette
    end

    describe "filtering the resultset" do
      after { VCR.eject_cassette }

      it "filters by limit" do
        VCR.insert_cassette 'creators_limited', record: :new_episodes
        creators = client.creators(limit: 4)
        creators.size.must_equal 4
      end

      it "filters by first name" do
        VCR.insert_cassette 'creators_by_first_name', record: :new_episodes
        creators = client.creators(firstName: 'Brian')
        creators.first.first_name.must_equal 'Brian'
      end
    end
  end

end
