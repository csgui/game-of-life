require File.expand_path('../test_helper', __FILE__)

class TestCell < MiniTest::Unit::TestCase

  def setup
    pos = [6, 8]
    @cell = GameOfLife::Cell.new(pos, GameOfLife::Live)
  end

  def test_x_coordinate
    assert_respond_to @cell, :x
  end

  def test_y_coordinate
    assert_respond_to @cell, :y
  end

  def test_neighborhood
    assert_equal @cell.neighborhood.size, 8
  end

  def test_neighborhood_data_type
    assert_instance_of Array, @cell.neighborhood
  end

end
