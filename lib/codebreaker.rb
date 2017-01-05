class CodeBreaker
  attr_reader :number_of_guesses
  
  def initialize
    @number_of_guesses = 0
  end
  
  def guess
    puts "What would you like to guess?"
    guessed = gets.chomp.split(//)
    if guessed.length == 4
      guessed.map! { |x| x.to_i }
      @number_of_guesses += 1
      return guessed
    else
      puts "Try Again!"
      guess
    end
  end
end