Learn more or give us feedback
require 'minitest/autorun'
require 'minitest/pride'
require './lib/vehicle'
require './lib/passenger'
​
class VehicleTest < Minitest::Test
  def test_it_exists
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_instance_of Vehicle, vehicle
  end
​
  def test_it_has_attributes
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal "2001", vehicle.year
    assert_equal "Honda", vehicle.make
    assert_equal "Civic", vehicle.model
  end
​
  def test_it_starts_with_no_passengers
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    assert_equal [], vehicle.passengers
  end
end
