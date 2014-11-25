#!/usr/local/bin/ruby

# Ask for file
puts "Enter file name: "

filename = gets.chomp

puts "Reading file: #{filename}"

words = []

# Read the file

File.open(filename, "r") do |f|
	f.each_line do |line|
		line.split(" ").each { |word|
			words << word
		}
	end	
end

# Construct the connections
word_connections = {}

previous_word = ""
words.each { |word|
	if (word_connections[previous_word].nil?)
		word_connections[previous_word] = {}
	end
	if (word_connections[previous_word][word].nil?)
		word_connections[previous_word][word] = 1
	else
		word_connections[previous_word][word] = word_connections[previous_word][word] + 1
	end
	previous_word = word
}



# Generate a chain

max_length = 15

keys = word_connections.keys
next_word = keys[rand(keys.size)]


length = 0
while (length < max_length) do
	printf("%s ", next_word)
	# Generate the next word
	if (word_connections[next_word].nil?)
		break
	end
	next_keys = word_connections[next_word].keys
	next_words = []
	next_keys.each { |word|
		count = word_connections[next_word][word]
		for i in 1..count
			next_words << word
		end
	}
	next_word = next_words[rand(next_words.size)]
	length = length + 1
end

puts "\n"
