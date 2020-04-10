class Student
  include MentorObserver
  attr_reader :name
  attr_accessor :mentors, :notifications

  def initialize(name)
    super()
    @name = name
    @notifications = []
  end

  def do_homework(hw_filename, solution)
    Homework.add_hw_solution(name, hw_filename, solution)

    notify_mentors(hw_filename)
  end

  def notify_student
    puts "Student #{name} notified!"
  end

  def read_notifications
    if @notifications != []
      puts "#{name}, check theese files:"
      @notifications.each { |notification| puts notification }
      @notifications.clear
    else
      puts "#{name}, you have 0 notifications"
    end
  end
end
