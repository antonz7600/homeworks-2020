# frozen_string_literal: true

require_relative 'custom_array'

# Custom array add
class Array
  include CustomArray
  def custom?
    true
  end
end
