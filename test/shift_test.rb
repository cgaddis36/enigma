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
      assert_equal 27, @shift.char_array.size
      assert_instance_of String, @shift.date
      assert_equal 6, @shift.date.size
    end

    def test_random_key_generator
      assert_instance_of Array, @shift.key
      assert_equal 5, @shift.key.size
    end

    def test_inner_number_keys_array
      assert_instance_of Array, @shift.inner_number_keys_array
      assert_equal 4, @shift.inner_number_keys_array.size
      assert_equal 4, @shift.inner_number_keys_array(60816).size
      assert_equal ["60", "08", "81", "16"], @shift.inner_number_keys_array(60816)
    end

    def test_encryption_hash
      expected = {"A"=>3, "B"=>27, "C"=>73, "D"=>20}
      assert_instance_of Hash, @shift.encryption_hash
      assert_equal 4, @shift.encryption_hash.size
      assert_equal expected, @shift.encryption_hash("02715", "040895")
    end

    def test_split_message
      assert_instance_of Array, @shift.split_message('Hello, World!')
      assert_equal [["h", "e", "l", "l"], ["o", ",", " ", "w"], ["o", "r", "l", "d"], ["!"]], @shift.split_message('Hello, World!')
      assert_equal 4, @shift.split_message("Hello, World!").size
    end

    def test_encrypted_message
      assert_instance_of String, @shift.encrypted_message("Hello, World!")
      assert_equal 13, @shift.encrypted_message("Hello, World!").size
      assert_equal "keder ohulw", @shift.encrypted_message("hello world", "02715", "040895")
    end

    def test_decryption_message
      assert_instance_of String, @shift.decrypted_message("keder ohulw", "02715", "040895")
      assert_equal 13, @shift.decrypted_message("Hello, World!").size
      assert_equal "hello world", @shift.decrypted_message("keder ohulw", "02715", "040895")
    end

    def test_encrypt
      expected1 = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      }
      expected2 = {
      encryption: "nib udmcxpu",
      key: "02715",
      date: "130120"
      }
      assert_equal expected1, @shift.encrypt("hello world", "02715", "040895")
      assert_equal expected2, @shift.encrypt("hello world", "02715")
      assert_instance_of Hash, @shift.encrypt("hello world", "02715")
    end

    def test_decrypt
      expected1 = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
      }
      expected2 = {
      decryption: "hello world",
      key: "02715",
      date: "130120"
      }
      assert_equal expected1, @shift.decrypt("keder ohulw", "02715", "040895")
      assert_instance_of Hash, @shift.decrypt("keder ohulw", "02715")
      assert_equal expected2, @shift.decrypt("nib udmcxpu", "02715")
    end

end
