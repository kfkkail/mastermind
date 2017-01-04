class CodeMaker
  attr_accessor :code
  attr_reader :feedback
  
  def initialize(totalpegs=6)
    @code = [nil, nil, nil, nil]
    @feedback = [:z, :z, :z, :z]
    @totalpegs = totalpegs
  end
  
  def create_code
    @code.map! { |x| x=rand(1..@totalpegs) }
  end
  
  def win_test(guess)
    @feedback = [:z, :z, :z, :z]
    whitepin=@code
    guess.map.with_index { |x, i| 
      if x == @code[i]
        @feedback.insert(0,:b)
        @feedback.pop
      elsif whitepin.include?(guess[i])
        @feedback.insert(0,:w)
        @feedback.pop
        delete = whitepin.index(guess[i])
        whitepin.delete_at(delete)
      end
    }
    display = @feedback.sort
    display.map! { |x|
      if x == :z
        x = " "
      else
        x = x
      end
      
    }
    puts  "\n-------\n"+
          "| #{display[0]} #{display[1]} |\n"+
          "| #{display[2]} #{display[3]} |\n"+
          "-------"
    return @feedback.sort
  end
end