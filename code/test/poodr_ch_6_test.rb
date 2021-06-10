gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './poodr_ch6_01.rb'

class BicycleTest < Minitest::Test
  def test_attributes
    skip
    bike = Bicycle.new(size: 'M', tape_color: 'red')

    spares = { 
      chain: '10-speed',
      tire_sice: '23',
      tape_color: 'red'
    }
      
    assert_equal 'M', bike.size 
    assert_equal 'red', bike.tape_color
    assert_equal spares, bike.spares
  end
  
  def test_mountain_bike_attributes
    bike = Bicycle.new(
      style: :mountain,
      size: 'S',
      front_shock: 'Manitou',
      rear_shock: 'Fox'
    )
    
    spares = {
      tire_size: "2.1",
      chain: "10-speed",
      rear_shock: 'Fox'
    }
    assert_equal :mountain, bike.style
    assert_equal 'Manitou', bike.front_shock
    assert_equal 'Fox', bike.rear_shock
    assert_equal spares, bike.spares
  end
end