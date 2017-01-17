Dir['lib/**.*'].each { |file| require_relative file }

class MasterMind
  def initialize
    @codemaker = CodeMaker.new
    @codebreaker = CodeBreaker.new
  end
  
  def start_game
    @codemaker.create_code
    puts @codemaker.code.to_s
    next_guess
  end
  
  def next_guess
    guess = @codebreaker.guess
    feedback = @codemaker.win_test(guess)
    puts @codemaker.code.to_s #for testing
    remaining_guesses = 10 - @codebreaker.number_of_guesses
    if feedback == [:b, :b, :b, :b]
      puts "You got it! I can't believe you did it."
      start_new_game
    elsif remaining_guesses == 0
      puts "No more guesses left. The code was #{@codemaker.code.to_s}."
      start_new_game
    else
      puts "Not quite right, #{remaining_guesses} guesses remaining"
      next_guess
    end
  end
  
  def start_new_game
    puts "Would you like to start a new game? (Y or N)"
    answer = gets.chomp.capitalize
    if answer == "Y"
      initialize
      start_game
    else
    end
  end
end

yay = MasterMind.new
yay.start_game