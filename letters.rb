class Letter
    def letter_function

      puts "Letters menu"
      puts "1) Your Input"
      puts "2) Exit"

      menu = gets.strip.to_i

      case menu
      when 1
        #call function
        letter_method
      when 2
        puts "goodbye!"
      else
        letter_function
      end
       letter_function
    end

    def letter_method
      puts "Whats your Input?"
      user_input = gets.strip
      wordArr=user_input.split

      newWordArr = wordArr.select do |word|

        if word.chars.find_all{ |e| word.chars.count(e) > 1 }.uniq.length != 0
             word
         end
      end
      puts "Highest repeated letters is in the word : #{newWordArr.join(',')}"
    end
  end

  Letter.new.letter_function