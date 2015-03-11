module GameOfLife
  class Evolution

    def self.step(organism)
      organism.system.each do |cell|
        if cell.state.instance_of? Live
          # - Rule 1 -
          # Any live cell with fewer than two live neighbours dies,
          # as if by loneliness.
          cell.transit if organism.alive_neighbors(cell).length < 2

          # - Rule 2 -
          # Any live cell with more than three live neighbours dies,
          # as if by overcrowding
          cell.transit if organism.alive_neighbors(cell).length > 3

          # - Rule 3 -
          # Any live cell with two or three live neighbours lives
          # on to the next generation.
          #
          # intrinsic
        else
          # - Rule 4 -
          # Any dead cell with exactly three live neighbours becomes
          # a live cell, as if by reproduction.
          cell.transit if organism.alive_neighbors(cell).length == 3
        end
      end
      organism
    end

  end
end
