require_relative "../spec_helper"

describe "a character entity" do
  before { VCR.insert_cassette 'character', record: :new_episodes }
  after { VCR.eject_cassette }

  describe "parsing the json argument" do
    let(:client) { Marvell::Client.new(public_key: "07e4dc912806b1c5d1e51687095bca09", private_key: 'a97d276fe66678f07ec9150e3012d41160937b85')}
    let(:character){ client.character(id: 1009521) }

    it "returns a hash result set" do
      character.result.must_be_instance_of Hash
    end

    it "returns a name" do
      character.name.must_equal " Hank Pym"
    end

    it "returns a description" do
      character.description.must_equal ""
    end

    it "returns a modified date" do
      character.modified.must_equal "1969-12-31T19:00:00-0500"
    end

    it "returns a thumbnail object" do
      character.thumbnail.must_be_instance_of Hash
    end

    it "returns a resource URI" do
      character.resourceURI.must_equal "http://gateway.marvel.com/v1/public/characters/1009521"
    end

    it "returns a comics object" do
      character.comics.must_be_instance_of Hash
    end

    it "returns a series object" do
      character.series.must_be_instance_of Hash
    end

    it "returns a stories object" do
      character.stories.must_be_instance_of Hash
    end

    it "returns an events object" do
      character.events.must_be_instance_of Hash
    end

    it "returns a set of public urls for the resource" do
      character.urls.must_be_instance_of Array
    end
  end
end
