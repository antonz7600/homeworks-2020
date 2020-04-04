require_relative 'custom_array'

class Array
  include CustomArray
  def custom?
    true
  end
end
