require File.expand_path('../test_helper', __FILE__)

class GameOfLifeTest < MiniTest::Unit::TestCase

  def setup
    @seed = [[1, 3], [2, 2], [2, 3], [2, 4], [3,1]]
    @block = [[1, 1], [1, 2], [2, 1], [2, 1]]
    @boat = [[0, 1], [1, 0], [2, 1], [0, 2], [1, 2]]
    @blinker = [[1, 1], [1, 0], [1, 2]]
    @toad = [[1, 1], [1, 2], [1, 3], [2, 2], [2, 3], [2, 4]]
    @beacon = [[1, 1], [1, 2], [2, 1], [2, 2], [3, 3], [3, 4], [4, 3], [4, 4]]
    @beehive = [[2, 2], [2, 4], [3, 2], [3, 4], [1, 3], [4, 3]]
  end

  def test_generic_seed_evolution
    output = [[1, 4], [1, 3], [1, 2], [2, 4], [2, 3], [2, 2], [3, 2], [3, 3]]
    evolution = GameOfLife::Organism.new(@seed).evolve

    assert_equal output.to_set, evolution.live_cells
  end

  def test_block_evolution
    output = [[1, 1], [1, 2], [2, 1], [2, 2]]
    evolution = GameOfLife::Organism.new(@block).evolve

    assert_equal output.to_set, evolution.live_cells
  end

  def test_boat_evolution
    output = [[0, 1], [1, 0], [2, 1], [0, 2], [1, 2]]
    evolution = GameOfLife::Organism.new(@boat).evolve

    assert_equal output.to_set, evolution.live_cells
  end

  def test_blinker_evolution
    output = [[1, 1], [0, 1], [2, 1]]
    evolution = GameOfLife::Organism.new(@blinker).evolve

    assert_equal output.to_set, evolution.live_cells
  end

  def test_toad_evolution
    output = [[0, 2], [1, 1], [1, 4], [2, 1], [2, 4], [3, 3]]
    evolution = GameOfLife::Organism.new(@toad).evolve

    assert_equal output.to_set, evolution.live_cells
  end

  def test_beacon_evolution
    output = [[1, 1], [1, 2], [2, 1], [3, 4], [4, 3], [4, 4]]
    evolution = GameOfLife::Organism.new(@beacon).evolve

    assert_equal output.to_set, evolution.live_cells
  end

  def test_beehive_evolution
    output = [[2, 2], [2, 4], [3, 2], [3, 4], [1, 3], [4, 3]]
    evolution = GameOfLife::Organism.new(@beehive).evolve

    assert_equal output.to_set, evolution.live_cells
  end

end
