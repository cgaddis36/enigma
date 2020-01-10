require_relative "test_helper"
require_relative '../lib/enigma'

class EnigmaTest < Minitest::Test

    def setup
      @enigma = Enigma.new
    end

    def test_enigma_exists
      assert_instance_of Enigma, @enigma
    end
end
