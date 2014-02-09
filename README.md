marvell
=======

A ruby wrapper for the Marvel Developer API

## Usage

```
client = Marvell::Client.new(public_key: '123456', private_key: "abcdef")

#fetch a single character
client.character(1009521)

#fetch a collection of characters
client.characters

#fetch a collection of characters with some filtering applied
client.characters(limit: 4)

#fetch a character by name
client.characters(name: "Spider-Man")


#fetch a collection of characters through another resource
client.characters(story_id: 5621)
```
