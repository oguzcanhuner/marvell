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

Copyright (c) 2014 Oz Huner

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
