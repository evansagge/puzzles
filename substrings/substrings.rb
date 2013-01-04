#!/usr/bin/env ruby

def longest_repeating_substring(text)
  longest = "" # placeholder for the longest repeating substring
  left_sub = text
  occurences = { left_sub => 1}

  begin
    # remove the last word to get a new substring
    left_sub.slice!(/\s+\S+$/)
    occurences[left_sub] = occurences[left_sub].to_i + 1

    if occurences[left_sub] > 1 and left_sub.length > longest.length
      longest = left_sub.dup
    end

    right_sub = left_sub.dup

    begin
      # remove the first word to get a new substring
      right_sub.slice!(/^\S+\s+/)
      occurences[right_sub] = occurences[right_sub].to_i + 1

      if occurences[right_sub] > 1 and right_sub.length > longest.length
        longest = right_sub.dup
      end
    end while right_sub =~ /\S\s+\S/
  end while left_sub =~ /\S\s+\S/

  longest
end

if ARGV.empty?
  $stderr.puts "No input file specified"
elsif !File.exists?(ARGV[0])
  $stderr.puts "File does not exist: #{ARGV[0]}"
else
  File.open(ARGV[0]) do |f|
    puts "Longest repeated substring:"
    puts longest_repeating_substring(f.read).inspect
  end
end

# ./substrings.rb sample.txt