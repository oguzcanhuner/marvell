require_relative "../spec_helper"

describe Marvell::Entity do
  let(:client) { Marvell::Client.new(public_key: ENV["PUBLIC_KEY"], private_key: ENV["PRIVATE_KEY"])}

  before { VCR.insert_cassette 'requests', record: :new_episodes }
  after { VCR.eject_cassette }
  
  it "finds an entity attribute if one exists" do
    character = client.character(id: 1009521)
    proc {character.name}.must_be_silent
  end

  it "throws an error if the given attribute doesn't exist" do
    character = client.character(id: 1009521)
    proc{character.some_random_attribute}.must_raise NoMethodError
  end
end
