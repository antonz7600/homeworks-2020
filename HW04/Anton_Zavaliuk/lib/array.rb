require_relative 'custom_array'
# frozen_string_literal: true

require_relative 'custom_array'

# Custom array merge with Array class
class Array
  include CustomArray
  def custom?
    true
  end
end
