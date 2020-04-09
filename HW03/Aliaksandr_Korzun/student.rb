# frozen_string_literal: true

# Student class

class Student < Human
  attr_accessor :pull_requests, :followers

  @@students = {}

  def self.all
    @@students
  end

  def self.find(surname)
    @@students[surname]
  end

  def initialize(name, surname)
    super(name, surname)
    @followers = []
    @pull_requests = []
    @@students[surname] = self
  end

  def create_pull_request!(pull_request, homework_number, code)
    validate_of_homework(homework_number)
    pull_requests << pull_request.create(surname,
                                         find_homework(homework_number), code)
    notify_followers
  end

  private

  def notify_followers
    followers.each do |follower|
      follower.notifications << Notification.new.message(surname)
    end
  end

  def find_homework(homework_number)
    Homework.find(homework_number)
  end

  def validate_of_homework(homework_number)
    raise 'Homework not found!' unless homework_number.is_a? Integer
  end
end
