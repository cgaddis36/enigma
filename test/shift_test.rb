require_relative "test_helper"
require './lib/shift'

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
      assert_instance_of Array, @shift.key
      assert_equal 5, @shift.key.size
    end

    def test_inner_number_array
      assert_instance_of Array, @shift.inner_number_array
      assert_equal 4, @shift.inner_number_array.size
      assert_equal 4, @shift.inner_number_array(60816).size
    end

    def test_offset_date_array
      assert_instance_of Array, @shift.offset
      assert_equal 4, @shift.offset.size
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

    def test_encrypt
      expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }
      assert_equal expected, @shift.encrypt("hello world", "02715", "040895")
      assert_instance_of Hash, @shift.encrypt("hello world", "02715")
    end

    def test_decryption_message
      assert_instance_of String, @shift.decrypted_message("keder ohulw", "02715", "040895")
      assert_equal "hello world", @shift.decrypted_message("keder ohulw", "02715", "040895")
    end

    def test_decryption_hash
      expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }
      assert_equal expected, @shift.decrypt("keder ohulw", "02715", "040895")
      assert_instance_of Hash, @shift.decrypt("keder ohulw", "02715")
    end

end
