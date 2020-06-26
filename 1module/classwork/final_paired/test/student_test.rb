require './lib/student'
require 'minitest/autorun'
require 'minitest/pride'

class StudentTest < Minitest::Test

  def setup
    @student = Student.new({name: "Morgan", age: 21})
  end

  def test_it_exists
    assert_instance_of Student, @student
  end

  def test_student_attributes
    assert_equal "Morgan", @student.name
    assert_equal 21, @student.age
    assert_equal [], @student.scores
  end

  def test_log_score
    assert_equal [], @student.scores
    @student.log_score(89)
    @student.log_score(78)
    assert_equal [89, 78], @student.scores
    assert_equal 83.5, @student.grade
  end
end
