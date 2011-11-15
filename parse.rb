#! /usr/bin/env ruby

File.open('xml/G.xml') do |file|
  file.each do |line|
    puts line if line.match =~ /<xml:id=\"([\da-zA-Z]+)\">/
  end
end
