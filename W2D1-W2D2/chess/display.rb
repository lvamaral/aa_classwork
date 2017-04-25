require 'colorize'
require_relative 'board', 'cursor'

class Display

  def initialize
    @board = board
    @cursor = cursor
  end

  def render
  end
end
