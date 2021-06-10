gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './poodr_ch6_01.rb'

class BicycleTest < Minitest::Test
  def test_attributes
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
end