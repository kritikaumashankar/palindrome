require 'to_words'

puts "Enter the number"
num = gets.strip.to_i
strLen = 0
while strLen != 4 do
  strLen = num.to_words.gsub(" ","").length
  puts "#{num} is #{strLen}"
  num=strLen
end

puts "Magic Number is #{strLen}"