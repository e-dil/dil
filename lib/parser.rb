#! /usr/bin/env ruby

%w[rubygems nokogiri].each{|x| require x}

r = Nokogiri::XML::Reader(File.open('./xml/G.xml', 'r'))
begin
  r.each do |node|
    puts node.name
  end 
rescue => e
  puts e.inspect
end
