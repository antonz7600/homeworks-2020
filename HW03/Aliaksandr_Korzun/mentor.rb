# frozen_string_literal: true

# Mentor class

class Mentor < Human
  attr_accessor :homeworks, :students, :notifications

  def initialize(name, surname)
    super(name, surname)
    @students = []
    @notifications = []
    @homeworks = []
  end

  # Show all stidents for choice
  def show_all_students
    Student.all
  end

  def subscribe_to(student_surname)
    students << find_student(student_surname)
    find_student(student_surname).followers << self
  end

  def unsubscribe_to(student_surname)
    students >> find_student(student_surname)
    find_student(student_surname).followers >> self
  end

  # Create task for students
  def create_homework(homework)
    homeworks << homework
  end

  def read_notifications!
    notifications.clear
  end

  private

  # Find of necessary student
  def find_student(student_surname)
    Student.find(student_surname)
  end
end
