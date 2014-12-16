marvell
=======

A ruby wrapper for the Marvel Developer API

## Download

```
gem install marvell
```

## Usage

Get your keys by signing up as a developer on [the Marvel Developer website](http://developer.marvel.com).

```ruby
client = Marvell::Client.new(public_key: '123456', private_key: "abcdef")

#fetch a single character
client.character(id: 1009521)

#fetch a single comic
client.comic(id: 36489)

#fetch a collection of characters
client.characters

#fetch a collection of characters with some filtering applied
client.characters(limit: 4)

#fetch a character by name
client.characters(name: "Spider-Man")

#fetch a collection of characters through another resource
client.characters(story_id: 5621)

#fetch 5 comics written by stan lee
creator = client.creators(first_name: "stan", last_name: "lee").first
client.comics(creator_id: creator.id, limit: 5)

```

Check out http://developer.marvel.com/docs to see all the available endpoints.

## Copyright

Yes
