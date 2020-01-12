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

    def test_random_key_generator
      assert_instance_of Array, @shift.rand_keys
      assert_equal 5, @shift.rand_keys.size
    end

    def test_inner_number_array
      assert_instance_of Array, @shift.inner_number_array
      assert_equal 4, @shift.inner_number_array.size
    end

    def test_offset_date_array
      assert_instance_of Array, @shift.offset_date_array
      assert_equal 4, @shift.offset_date_array.size
    end

    def test_encryption_hash
      assert_instance_of Hash, @shift.encryption_hash
      assert_equal 4, @shift.encryption_hash.size
    end

    def test_split_message
      assert_instance_of Array, @shift.split_message('Hello, World!')
      assert_equal [["h", "e", "l", "l"], ["o", ",", " ", "w"], ["o", "r", "l", "d"], ["!"]], @shift.split_message('Hello, World!')
      assert_equal 4, @shift.split_message("Hello, World!").size
    end

    def test_encrypted_message
      assert_instance_of String, @shift.encrypted_message("Hello, World!")
      assert_equal 13, @shift.encrypted_message("Hello, World!").size
    end

end
