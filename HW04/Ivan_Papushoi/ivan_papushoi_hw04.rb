# frozen_string_literal: true

class Array
  def my_each
    for i in 0..self.length - 1
      yield self[i]
    end
    self
  end

  def my_select
    output = []
    for i in 0..self.length - 1
      output << self[i] if yield self[i]
    end
    output
  end

  def my_map
    output = []
    for i in 0..self.length - 1
      output << yield(self[i])
    end
    output
  end
end
