require './lib/student'
require './lib/course'
require './lib/term'
require 'minitest/autorun'
require 'minitest/pride'

class TermTest < Minitest::Test

  def setup
    @term = Term.new("Winter 2018")
    @course1 = Course.new("Calculus", 2)
    @course2 = Course.new("History", 2)
    @student1 = Student.new({name: "Morgan", age: 21})
    @student2 = Student.new({name: "Jordan", age: 29})
    @student3 = Student.new({name: "Minnie", age: 22})
    @student4 = Student.new({name: "Jamie", age: 27})
  end

  def test_term_exists
    assert_instance_of Term, @term
  end

  def test_term_attributes
    assert_equal "Winter 2018", @term.name
  end

  def test_add_courses
    assert_equal [], @term.courses
    @course1.enroll(@student1)
    @course1.enroll(@student2)
    @course2.enroll(@student3)
    @course2.enroll(@student4)
    @term.add_course(@course1)
    @term.add_course(@course2)
    assert_equal [@course1, @course2], @term.courses
  end

  def test_open_courses
    @term.add_course(@course1)
    @term.add_course(@course2)
    assert_equal [@course1, @course2], @term.open?
    @course1.enroll(@student1)
    @course1.enroll(@student2)
    @course2.enroll(@student3)
    @course2.enroll(@student4)
    assert_equal [], @term.open?
  end

  def test_all_students
    assert_equal [], @term.all_students
    @course1.enroll(@student1)
    @course1.enroll(@student2)
    @course2.enroll(@student3)
    @course2.enroll(@student4)
    @term.add_course(@course1)
    @term.add_course(@course2)
    assert_equal [@student1, @student2, @student3, @student4], @term.all_students
  end

end
