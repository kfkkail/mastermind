class CodeBreaker
  def initialize
    @number_of_guesses = 0
  end
  
  def guess
    puts "What would you like to guess?"
    guess = gets.chomp.split(//)
    guess.map! { |x| x.to_i }
    puts guess.to_s
    @number_of_guesses += 1
    return guess
  end
end