require 'codemaker'
require 'codebreaker'

class MasterMind
  def initialize
    @codemaker = CodeMaker.new
    @codebreaker = CodeBreaker.new
  end
  
  def start_game
    @codemaker.create_code
    next_guess
  end
  
  def next_guess
    @codebreaker.guess
  end
end

yay = MasterMind.new
yay.start_game