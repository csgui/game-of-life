require File.expand_path('../test_helper', __FILE__)

class TestOrganism < MiniTest::Unit::TestCase

  def setup
    seed = [[1, 3], [2, 2], [2, 3], [2, 4], [3,1]]
    @organism = GameOfLife::Organism.new(seed)

  end

  def test_cells
    assert_respond_to @organism, :seed
  end

end
