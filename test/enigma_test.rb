require_relative "test_helper"
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test

    def setup
      @enigma = Enigma.new
    end

    def test_enigma_exists
      assert_instance_of Enigma, @enigma
    end

    def test_encrypt_message_test
      assert_instance_of String, @enigma.encrypt("Hello, World!")
      assert_equal 13, @enigma.encrypt("Hello, World!").size
    end
end
