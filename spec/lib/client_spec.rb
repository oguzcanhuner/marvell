require_relative "../spec_helper"

describe Marvel::Client do
  let(:client) { Marvel::Client.new(public_key: "07e4dc912806b1c5d1e51687095bca09", private_key: 'a97d276fe66678f07ec9150e3012d41160937b85')}

  before { VCR.insert_cassette 'requests', record: :new_episodes }
  after { VCR.eject_cassette }

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
      character = client.character(id: 1009521)
      character.must_be_instance_of Marvel::Entity
      character.name.must_equal " Hank Pym"
    end
  end

  describe "#characters" do

    it "returns an array of characters" do
      characters = client.characters
      characters.must_be_instance_of Array
      characters.first.must_be_instance_of Marvel::Entity
    end

    describe "filtering the resultset" do

      it "filters by limit" do
        characters = client.characters(limit: 4)
        characters.size.must_equal 4
      end

      it "filters by name" do
        characters = client.characters(name: 'Spider-Man')
        characters.first.name.must_equal "Spider-Man"
      end
    end

    describe "second class resources" do
      it "returns a set of characters which belong to a comic" do
        characters = client.characters(comic_id: 36489)
        characters.first.name.must_equal " Hank Pym"
      end

      it "returns a set of characters which belong to a story" do
        characters = client.characters(story_id: 5621)
        characters.first.name.must_equal " Hank Pym"
      end

      it "returns a set of characters which belong to a series" do
        characters = client.characters(series_id: 20)
        characters.first.name.must_equal "Ben Urich"
      end

      it "returns a set of characters which belong to an event" do
        characters = client.characters(event_id: 318)
        characters.first.name.must_equal " Hank Pym"
      end
    end
  end

  describe "#comic" do
    it "given an id, returns a Marvel::Entity object" do
      comic = client.comic(id: 41530)
      comic.must_be_instance_of Marvel::Entity
    end
  end

  describe "#comics" do
    it "returns an array of comics" do
      comics = client.comics
      comics.must_be_instance_of Array
      comics.first.must_be_instance_of Marvel::Entity
    end

    describe "filtering the resultset" do

      it "filters by limit" do
        comics = client.comics(limit: 4)
        comics.size.must_equal 4
      end

      it "filters by format" do
        comics = client.comics(format: 'digital comic')
        comics.first.format.must_equal 'Digital Comic'
      end
    end
  end

  describe '#creator' do
    it "given an id, returns a Marvel::Entity object" do
      creator = client.creator(id: 546)
      creator.must_be_instance_of Marvel::Entity
    end
  end

  describe '#creators' do
    it 'returns an array of creators' do
      creators = client.creators
      creators.must_be_instance_of Array
      creators.first.must_be_instance_of Marvel::Entity
    end

    describe "filtering the resultset" do

      it "filters by limit" do
        creators = client.creators(limit: 4)
        creators.size.must_equal 4
      end

      it "filters by first name" do
        creators = client.creators(firstName: 'Brian')
        creators.first.first_name.must_equal 'Brian'
      end
    end
  end

  describe "#story" do

    it "given an id, returns a Marvel::Entity object" do
      story = client.story(id: 3)
      story.must_be_instance_of Marvel::Entity
    end
  end

  describe "#stories" do

    it "returns an array of stories" do
      stories = client.stories
      stories.must_be_instance_of Array
      stories.first.must_be_instance_of Marvel::Entity
    end

    describe "filtering the resultset" do

      it "filters by limit" do
        stories = client.stories(limit: 4)
        stories.size.must_equal 4
      end
    end
  end

  describe "#serie" do

    it "given an id, returns a Marvel::Entity object" do
      serie = client.serie(id: 3)
      serie.must_be_instance_of Marvel::Entity
    end
  end

  describe "#series" do

    it "returns an array of series" do
      series = client.series
      series.must_be_instance_of Array
      series.first.must_be_instance_of Marvel::Entity
    end

    describe "filtering the resultset" do

      it "filters by limit" do
        series = client.stories(limit: 4)
        series.size.must_equal 4
      end
    end
  end

end
