#! /usr/bin ruby
# Connect to the 'results' mqtt topic on the mqtt hostname, read the json messages and persists it in MongoDB

require "mqtt"
require "json"
require "mongo"

client = Mongo::Client.new('mongodb://127.0.0.1:27017/hulkdevfestgame')
collection = client[:results]

#connect to the mqtt 'results topic' parse the result json messages and tweet them
MQTT::Client.connect(:host => '127.0.0.1', :port => 1883) do |c|
  c.get('results') do |topic,json_message|
    begin
      message_hash = JSON.parse(json_message)
      puts "New message --> #{message_hash}"
      result = collection.insert_one(message_hash)
      puts "#{result}"
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
    end
  end
end


