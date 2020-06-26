require 'minitest/autorun'
require 'minitest/pride'

class StudentTest < Minitest::Test
  def test_it_exists
    student = Student.new("Jesse")
    assert_instance_of Student, student
  end

  def test_it_has_attributes
    student = Student.new("Jesse")
    assert_equal "Jesse", student.name
    assert_equal "1", student.mod 

  end
end
