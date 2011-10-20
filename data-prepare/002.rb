#002. Task is to find all kinds of references from <a> elements of the HTML documents
# and give that information to facilitate the writing of subsequent scripts
# assumes something like `html_abstr` to be existent inside $MIZFILES
#it's probably /usr/local/share/mizar/html_abstr

require 'pry'
require File.expand_path('../helpers',__FILE__)
require 'mongo'
include Mongo

host = ENV['MONGO_RUBY_DRIVER_HOST'] || 'localhost'
port = ENV['MONGO_RUBY_DRIVER_PORT'] || Connection::DEFAULT_PORT

puts "Connecting to #{host}:#{port}"
db = Connection.new(host, port).db('t2ku')
coll = db.collection('articles')
@cached_art = {}
coll.find().each{ |article| @cached_art[article['name']]=article['_id']}

filepaths = []

coll.find().each{ |article|
  filepath = "#{ENV['MIZFILES']}/html_abstr/#{article['name']}.html"
  unless File.exists? filepath
    raise "No such file: #{filepath}"
  else
    filepaths << filepath
  end
}
puts "All HTML File existent"

bigarr = []
0.upto(filepaths.size-1) do |o|
  filepath = filepaths[o]
  print "#{filepath}..."
  begin
    require 'nokogiri'
    arr = []
    File.open(filepath,"r") do |file|
      @doc = Nokogiri::HTML(file)
      arr = @doc.xpath('//a').collect{|a| 
        (a.attributes['href'].value) if a.attributes['href']
      }.compact.collect{|s|
        pos_to_type(s)
      }.compact.uniq.sort
    end
    print "OK\n"
    p arr
    bigarr += arr
    bigarr = bigarr.uniq
  rescue Exception => e
    print "#{e}\n"
    binding.pry
  end
end

p bigarr.sort

# Final result
# ["D", "E", "G", "K", "L", "M", "NK", "NM", "NR", "NV", "R", "S", "T", "U", "V"]
