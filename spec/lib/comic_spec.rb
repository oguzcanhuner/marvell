require_relative "../spec_helper"

describe 'marvel comic entity' do
  before { VCR.insert_cassette 'requests', record: :new_episodes }
  after { VCR.eject_cassette }

  let(:client) { Marvell::Client.new(public_key: ENV["PUBLIC_KEY"], private_key: ENV["PRIVATE_KEY"])}
  let(:comic){ client.comic(id: 41530) }

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
