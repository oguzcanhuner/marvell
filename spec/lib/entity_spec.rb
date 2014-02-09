require_relative "../spec_helper"

describe Marvell::Entity do
  let(:client) { Marvell::Client.new(public_key: "07e4dc912806b1c5d1e51687095bca09", private_key: 'a97d276fe66678f07ec9150e3012d41160937b85')}

  before { VCR.insert_cassette 'character', record: :new_episodes }
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
