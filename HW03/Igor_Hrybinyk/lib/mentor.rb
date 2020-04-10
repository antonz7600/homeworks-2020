class Mentor
  include StudentObserver
  attr_reader :name
  attr_accessor :students, :notifications

  def initialize(name)
    super()
    @name = name
    @notifications = []
  end

  def create_homework(hw_filename, task)
    Homework.add_homework(name, hw_filename, task)
    notify_students(students, hw_filename)
  end

  def write_review(student, hw_filename, review)
    Homework.add_review(hw_filename, review)
    notify_students([student], hw_filename)
  end

  def create_hw_directory
    Dir.mkdir('homeworks') unless Dir.exist?('homeworks')
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

  def update_mentor
    puts "Mentor #{name} notified!"
  end
end
