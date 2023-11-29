#!/usr/bin/env ruby
text = ARGV[0]

sender = text.match(/\[from:([^\]]+)\]/)
receiver = text.match(/\[to:([^\]]+)\]/)
flags = text.match(/\[flags:([^\]]+)\]/)
puts "#{sender[1]},#{receiver[1]},#{flags[1]}"
