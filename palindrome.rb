require 'colorize'

class Palindrome
  def initialize
    @palinStr = ''
    palindrome_method

  end

  def palindrome_method
    new_palin_str = ''
    puts "Enter the String:"
    @palin_str = gets.chomp
    len = (@palin_str.length) - 1
    while len >=0 
      new_palin_str += @palin_str[len]
      len-=1
    end
    if new_palin_str.casecmp(@palin_str) == 0
      puts "#{@palin_str} is a palindrome!!".colorize(:green)
    else
      puts "#{@palin_str} is not palindrome!!".colorize(:red)
    end
    palindrome_method
  end
end

Palindrome.new