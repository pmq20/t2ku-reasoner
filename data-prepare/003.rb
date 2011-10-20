#002. Task is to read information from the html version of mml
# assumes something like `html_abstr` to be existent inside $MIZFILES
#it's probably /usr/local/share/mizar/html_abstr

require 'pry'
require 'ruby-debug'
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
colldef = db.collection('definitions')
collthm = db.collection('theorems')

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


setwhat = {}

0.upto(filepaths.size-1) do |o|
  filepath = filepaths[o]
  print "#{filepath}..."
  begin
    require 'nokogiri'

    File.open(filepath,"r") do |file|
      @doc = Nokogiri::HTML(file)
      @spans = @doc.xpath('/html/body/span')
      i = 0
      setwhat[:description] = ''
      while i<@spans.count
        span = @spans[i]
        break unless '::'==span.text[0..1]
        setwhat[:description] += span.text[2..-1].strip
        setwhat[:description] += "\n"
        i += 1
      end
      while "begin" != @spans[i].text.strip
        i += 1
      end
      # now that "begin" == @spans[i].text.strip
      # we can begin the importing proper
      while i+1<@spans.count
        arr = collect_between(@spans[i],@spans[i+1])
        debugger
        case arr[0].text.strip
        when 'begin'
          j = 0
        when 'deftheorem'
          binding.pry unless @spans[i+1].text =~ /^Def(\d+)$/
          i += 1
          arr_more = collect_between(@spans[i],@spans[i+1])
          binding.pry unless "defines" == arr_more[1].text.strip
          binding.pry unless "a" == arr_more[2].name
          instance = pos_to_instance(arr_more[2].attributes['href'].value)
          # colldef.update({:number => $1, :article_id=>article.id},{:deftheorem=>})
        else
          binding.pry
        end
        while j<arr.size
          div_handle(arr[j]) if 'div'==arr[j].name
          j += 1
        end
        i += 1
      end
      
      
      binding.pry
    end
    print "OK\n"
  rescue Exception => e
    print "#{e}\n"
    binding.pry
  end
end