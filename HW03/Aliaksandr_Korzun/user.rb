# frozen_string_literal: true

# Human class

class Human
  attr_accessor :name, :surname

  def initialize(name, surname)
    @name = name
    @surname = surname
  end
end
