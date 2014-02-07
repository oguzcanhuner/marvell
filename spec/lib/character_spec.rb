require_relative "../spec_helper"

describe Marvel::Character do
  describe "parsing the json argument" do
    let(:character){ 
      character_data = Marvel::JsonParser.parse_result_set(fixture('character')).first
      Marvel::Character.new(character_data)
    }

    it "returns a hash result set" do
      character.result.must_be_instance_of Hash
    end

    it "returns a name" do
      character.name.must_equal " Hank Pym"
    end

    it "returns a description" do
      character.description.must_equal "test description"
    end

    it "returns a modified date" do
      character.modified.must_equal "1969-12-31T19:00:00-0500"
    end

    it "returns a thumbnail object" do
      character.thumbnail.must_equal({"path"=>"http://i.annihil.us/u/prod/marvel/i/mg/8/c0/4ce5a0e31f109", "extension"=>"jpg"})
    end

    it "returns a resource URI" do
      character.resourceURI.must_equal "http://gateway.marvel.com/v1/public/characters/1009521"
    end

    it "returns a comics object" do
      character.comics.must_equal({"available"=>2, "collectionURI"=> "http://gateway.marvel.com/v1/public/characters/1009521/comics", "items"=> [{"resourceURI"=>"http://gateway.marvel.com/v1/public/comics/35533", "name"=>"Amazing Spider-Man (1999) #661"}, {"resourceURI"=>"http://gateway.marvel.com/v1/public/comics/39041", "name"=>"Amazing Spider-Man (1999) #661 (X-Men Art Variant)"}], "returned"=>2})
    end

    it "returns a series object" do
      character.series.must_equal({"available"=>12, "collectionURI"=> "http://gateway.marvel.com/v1/public/characters/1009521/series", "items"=> [{"resourceURI"=>"http://gateway.marvel.com/v1/public/series/454", "name"=>"Amazing Spider-Man (1999 - 2013)"}, {"resourceURI"=>"http://gateway.marvel.com/v1/public/series/1991", "name"=>"Avengers (1963 - 1996)"}], "returned"=>2})
    end

    it "returns a stories object" do
      character.stories.must_equal({"available"=>43, "collectionURI"=> "http://gateway.marvel.com/v4/public/characters/1009521/stories", "items"=> [{"resourceURI"=>"http://gateway.marvel.com/v1/public/stories/5621", "name"=>"1 of 6 - 6XLS", "type"=>"cover"}, {"resourceURI"=>"http://gateway.marvel.com/v1/public/stories/8682", "name"=>"3 of 6 - Ultron; THE INITIATIVE BANNER", "type"=>"interiorStory"}], "returned"=>2})
    end

    it "returns an events object" do
      character.events.must_equal({"available"=>6, "collectionURI"=> "http://gateway.marvel.com/v1/public/characters/1009521/events", "items"=> [{"resourceURI"=>"http://gateway.marvel.com/v1/public/events/318", "name"=>"Dark Reign"}, {"resourceURI"=>"http://gateway.marvel.com/v1/public/events/302", "name"=>"Fear Itself"}], "returned"=>2})
    end

    it "returns a set of public urls for the resource" do
      character.urls.must_equal([{"type"=>"detail", "url"=> "http://marvel.com/comics/characters/1009521/_hank_pym?utm_campaign=apiRef&utm_source=07e4dc912806b1c5d1e51687095bca09"}])
    end
  end
end
