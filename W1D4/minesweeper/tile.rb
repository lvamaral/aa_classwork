class Tile

  def initialize
    @revealed = false
    @value = 0
    @flagged = false
  end

  def display
    if flagged
      "F"
    elsif !revealed
      " "
    else
      value
    end
  end

end
