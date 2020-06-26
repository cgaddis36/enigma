class Term
  attr_reader :name, :courses

  def initialize(name)
    @name = name
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def open?
    open_courses = []
    @courses.each do |course|
      if !course.full?
      open_courses << course
      end
    end
    open_courses
  end

  def all_students
    students = []
    @courses.each do |course|
      course.students.each do |student|
        students << student
      end
    end
    students
  end
end
