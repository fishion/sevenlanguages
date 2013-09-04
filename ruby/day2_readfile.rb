#!/usr/bin/ruby

File.open('day2_readfile.txt', 'r') do |file|
    index = 0
    file.each do |line|
        index += 1
        puts "#{index}: #{line}" if line.match(/shazam/)
    end
end
