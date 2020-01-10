require_relative "test_helper"
require_relative '../lib/shift'

class ShiftTest < Minitest::Test

    def setup
      @shift = Shift.new
    end

    def test_shift_exists
      assert_instance_of Shift, @shift
    end

    def test_shift_attributes
      expected = ["a", "b", "c", "d", "e", "f", "g", "h", 
                  "i", "j", "k", "l", "m", "n", "o", "p",
                  "q", "r", "s", "t", "u", "v", "w", "x",
                  "y", "z", " "]
      assert_instance_of Array, @shift.char_array
      assert_equal expected, @shift.char_array
    end
end
