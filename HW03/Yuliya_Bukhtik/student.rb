# frozen_string_literal: true

require_relative 'observable'

class Student
  include Observable

  attr_accessor :name, :surname, :homework

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homework = homework
    @list_of_homeworks = []
  end

  def add_homework
    @list_of_homeworks << @homework
  end
end
