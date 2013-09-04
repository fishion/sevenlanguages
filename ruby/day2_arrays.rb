#!/usr/bin/ruby

a = [*(1..16)]

puts 'With each'
a.each {|i| puts a[i-4..i-1].join(', ') if i % 4 == 0 }

puts 'with each_slice'
a.each_slice(4) {|i| p i}
