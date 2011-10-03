#! /usr/bin/env ruby

require 'rubygems'
require 'nokogiri'

class DilParser < Nokogiri::XML::SAX::Document
  @stack = []

  def start_element(name, a = [])
    @stack.push {name => a}
  end

  def characters(s)
    case @tag
      
    end
  end

  def end_element(name)
    @stack.pop
  end
end

f = File.open('./xml/G.xml', 'r')
p = Nokogiri::XML::SAX::Parser.new(DilParser.new)
p.parse(f)
