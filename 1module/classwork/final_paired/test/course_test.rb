require './lib/student'
require './lib/course'
require 'minitest/autorun'
require 'minitest/pride'

class CourseTest < Minitest::Test

  def setup
    @course = Course.new("Calculus", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
  end

  def test_course_exists
    assert_instance_of Course, @course
  end


  def test_course_attributes
    assert_equal "Calculus", @course.name
    assert_equal 2, @course.capacity
    assert_equal [], @course.students
  end

  def test_full?
    assert_equal [], @course.students
    refute @course.full?
    @course.enroll(@student1)
    @course.enroll(@student2)
    assert_equal [@student1, @student2], @course.students
    assert @course.full?
  end
end
