require 'minitest/autorun'
require 'minitest/pride'
require './lib/passenger'
​
class PassengerTest < Minitest::Test
  def test_it_exists
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_instance_of Passenger, charlie
  end
​
  def test_it_has_attributes
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    assert_equal "Charlie", charlie.name
    assert_equal 18, charlie.age
  end
end
