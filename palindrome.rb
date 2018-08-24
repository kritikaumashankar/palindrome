class Palindrome
  def initialize
    @palinStr = ''
    @new_palin_str = ''
  end

  def palindrome_method
    puts "Enter the String:"
    @palin_str = gets.strip
    len = (@palin_str.length) - 1
    puts len
    while len >=0 
      @new_palin_str += @palin_str[len]
      len-=1
    end
    if(@new_palin_str.casecmp? @palin_str)
      puts "#{@palin_str} is a palindrome!!"
    else
      puts "#{@palin_str} is not palindrome!!"
    end
    palindrome_method
  end
end

Palindrome.new.palindrome_method