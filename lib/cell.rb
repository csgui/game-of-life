module GameOfLife
  # context: Cell
  class Cell

    attr_reader :x, :y, :neighborhood
    attr_accessor :state

    def initialize(position, state)
      @x, @y = position
      @neighborhood = neighbors
      @state = state
    end

    def transit
      state.transit(self)
    end

    def neighbors
      [
       [x - 1, y - 1],
       [x + 1, y + 1],
       [x - 1, y + 1],
       [x + 1, y - 1],
       [x - 1, y],
       [x + 1, y],
       [x, y - 1],
       [x, y + 1]
      ]
    end

  end

  # concrete state: Live cell
  class Live
    def transit(cell)
      cell.state = Dead.new
    end
  end

  # concrete state: Dead cell
  class Dead
    def transit(cell)
      cell.state = Live.new
    end
  end

end
