require_relative "test_helper"
require_relative '../lib/enigma'
require_relative '../lib/shift'

class EnigmaTest < Minitest::Test

    def setup
      @enigma = Enigma.new
      @shift = Shift.new
    end

    def test_enigma_exists
      assert_instance_of Enigma, @enigma
      assert_instance_of Shift, @shift
    end

    def test_enigma_super_attrbutes
      assert_instance_of Array, @enigma.key
      assert_equal 5, @enigma.key.size
    end

    def test_encrypt_message_test
      assert_instance_of Hash, @enigma.encrypt("Hello, World!", "02715")
      assert_equal 3, @enigma.encrypt("Hello, World!").size
    end

    def test_decrypt_message_test
      assert_instance_of Hash, @enigma.decrypt("oioeu, dkfjb!")
      assert_equal 3, @enigma.decrypt("oioeu, dkfjb!").size
    end
end
