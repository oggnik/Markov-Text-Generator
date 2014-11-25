#!/usr/local/bin/ruby

# Ask for file
puts "Enter file name: "

filename = gets.chomp

puts "Reading file: #{filename}"

words = []

# Read the file

File.open(filename, "r") do |f|
	f.each_line do |line|
		words << line.split(" ")
	end	
end

puts words
