require_relative "../spec_helper"

describe Marvel::Comic do
  let(:comic){ 
    comic_data = Marvel::JsonParser.parse_result_set(fixture('comic')).first
    Marvel::Entity.new(comic_data)
  }

  it "returns a hash result set" do
    comic.result.must_be_instance_of Hash
  end

  it "returns a title" do
    comic.title.must_equal "Ant-Man: So (Trade Paperback)"
  end

  it "returns a description" do
    comic.description.must_include "It's the origin of the original Avenger"
  end

  it "returns the date of last modification" do
    comic.modified.must_equal "2012-09-25T18:05:58-0400"
  end

  it "returns the isbn number" do
    comic.isbn.must_equal "978-0-7851-6390-9"
  end
end
