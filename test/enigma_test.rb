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
    end

    def test_encrypt_message_test
      assert_instance_of String, @enigma.encrypt("Hello, World!")
      assert_equal 13, @enigma.encrypt("Hello, World!").size
    end
end
