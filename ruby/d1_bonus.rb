#!/usr/bin/env ruby

o = rand(10)
puts "I've picked a number between 0 and 9."
puts "Can you guess it?"
n = gets.to_i
not_first = false

while n != o
	if not_first 
		puts "Have a guess?"
		n = gets.to_i
	end

	not_first = true

	if n == o
		puts "You guessed it!"
	elsif n < o
		puts "Your guess is too low."
	elsif n > o
		puts "Your guess is too high."
	end

end
