require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'

class StudentTest < Minitest::Test

  def test_it_exists
    penny = Student.new('Penelope')
    assert_instance_of Student, penny
  end

  def test_it_has_a_name
    penny = Student.new('Penelope')
    assert_equal "Penelope", penny.name
  end

end
