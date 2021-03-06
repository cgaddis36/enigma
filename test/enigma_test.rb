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
      assert_instance_of String, @enigma.date
      assert_equal 5, @enigma.key.size
      assert_equal "150120", @enigma.date
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
      date: "150120"
      }
      assert_instance_of Hash, @enigma.encrypt("Hello, World!", "02715")
      assert_instance_of Hash, @enigma.encrypt("Hello, World!")
      assert_equal expected1, @enigma.encrypt("hello world", "02715", "040895")
      assert_equal expected2, @enigma.encrypt("hello world", "02715")
      assert_equal 3, @enigma.encrypt("Hello, World!").size
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
      date: "150120"
      }
      assert_instance_of Hash, @enigma.decrypt("oioeu, dkfjb!")
      assert_equal expected1, @enigma.decrypt("keder ohulw", "02715", "040895")
      assert_equal expected2, @enigma.decrypt("nib udmcxpu", "02715")
      assert_equal 3, @enigma.decrypt("oioeu, dkfjb!").size
      encrypted = @enigma.encrypt("hello world", "02715")
      assert_equal expected2, @enigma.decrypt(encrypted[:encryption], "02715")
    end
end
