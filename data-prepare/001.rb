#this series of scripts would deal with the situation where already imported records exist
#the scripts should update existing records and not introduce problems

#001. task: create articles according to mml
#assumes the environment var $MIZFILS to be set properly
#it's probably /usr/local/share/mizar

require 'pry'
require File.expand_path('../helpers',__FILE__)
require 'mongo'
include Mongo

host = ENV['MONGO_RUBY_DRIVER_HOST'] || 'localhost'
port = ENV['MONGO_RUBY_DRIVER_PORT'] || Connection::DEFAULT_PORT

puts "Connecting to #{host}:#{port}"
db = Connection.new(host, port).db('t2ku')
coll = db.collection('articles')

Dir.glob(ENV['MIZFILES']+"/mml/*.miz") do |fullfilename|
  characteristic = {:name => File.basename(fullfilename).split('.')[0]}
  doc = coll.find_one(characteristic)
  doc ||= coll.insert(characteristic)
end

puts coll.count