class ArraySort
  def initialize
    puts "#{ARGV[0]}"
    puts "#{ARGV[1]}"
  end

  def lowHighMethod(choice,arr_string)
     @arr = arr_string.split(' ').map {|x| x.to_i}
    puts "1) Highest Value or 2) Lowest Value"
    
    if choice.downcase.eql? "highest"
      puts "Highest Number in an array is: #{arraySorting(choice)}"
    else
      puts "Lowest Number in an array is: #{arraySorting(choice)}"
    end
  end
    def arraySorting(choice)
        @j=0
          while @j <= @arr.length
            for y in (0...@arr.length - 1)
              if @arr[y] > @arr[y+1]

                num = @arr[y]
                @arr[y] = @arr[y+1]
                @arr[y+1] = num

              end
            end
            @j+=1
          end

        puts @arr
        if choice.eql? "highest"
          @arr.last  
        else  
          @arr.first
        end
    end
end
if !ARGV.empty?
  ArraySort.new.lowHighMethod(ARGV[0],ARGV[1])
end