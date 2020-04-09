# frozen_string_literal: true

# Homework class
class Homework
  attr_reader :number, :task

  @@homeworks = {}

  def self.find(number)
    @@homeworks[number]
  end

  def initialize(number, task)
    @number = number
    @task = task
    @@homeworks[number] = self
  end
end
