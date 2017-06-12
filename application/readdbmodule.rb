#! /usr/bin ruby
# Connect to MongoDB Instance and read all messages of collection results

require "json"
require "mongo"

client = Mongo::Client.new('mongodb://127.0.0.1:27017/hulkdevfestgame')
collection = client[:results]

collection.find.each do |document|
  # access one property of the document
  # puts document["player"]
  json = document.to_json
  puts json
end