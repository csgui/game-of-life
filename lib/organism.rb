require 'evolution'

module GameOfLife
  class Organism

    attr_reader :system, :seed

    def initialize(seed)
      @seed = []
      seed.each do |position|
        @seed << Cell.new(position, Live.new)
      end
      @seed.extend(ArrayExtension)

      @system = []
      neighbors.each do |position|
        @system << Cell.new(position, Dead.new)
      end
      @system += @seed
    end

    def evolve
      Evolution.step(self)
    end

    def alive_neighbors(cell)
      cell.neighbors & seed.to_array
    end

    def live_cells
      Set.new.tap do |s|
        system.each do |cell|
          s << [cell.x, cell.y] if cell.state.instance_of? Live
        end
      end
    end

  private

    def neighbors
      Set.new.tap do |s|
        seed.each do |cell|
          cell.neighborhood.each do |neighbor|
            s << neighbor
          end
        end

        seed.each do |cell|
          s.delete([cell.x, cell.y])
        end
      end
    end
  end

  module ArrayExtension
    def to_array
      Array.new.tap do |a|
        self.each do |cell|
          a << [cell.x, cell.y]
        end
      end
    end
  end

end
