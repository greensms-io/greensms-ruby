require_relative "init"

@client = Example::CLIENT

puts "Whois Lookup"
puts @client.whois.lookup(to:"79260000000")

