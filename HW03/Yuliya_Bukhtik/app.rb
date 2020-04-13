# frozen_string_literal: true

# this is a main module to run the application

require_relative 'student'
require_relative 'mentor'
require_relative 'homework'
require_relative 'notification'

module App
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

    student.add_observer(Homework.new)
    student.add_observer(Notification.new)

    student.homework = 'homework_date.txt' # student submitted his homework
    mentor.notification = "check please HW #{student.homework_date}"

    student.notify_observers

    mentor.read_notifications!
  end
end
