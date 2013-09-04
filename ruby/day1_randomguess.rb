#!/usr/bin/ruby
rand = rand(10) + 1;
puts 'Hi, guess a number'
while (got = gets.to_i) != rand
    puts "#{got} is too high" if got > rand
    puts "#{got} is too low" if got < rand
end
puts "well done"
