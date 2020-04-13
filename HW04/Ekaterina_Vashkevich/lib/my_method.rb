# frozen_string_literal: true

# Module contain my implement each, map and select
module MyMethod
  def my_each
    return to_enum(:my_each) unless block_given?

    index = 0
    while index < length
      yield(self[index])
      index += 1
    end
    self
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    rezult = []
    index = 0
    while index < length
      rezult << yield(self[index])
      index += 1
    end
    rezult
  end

  def my_select
    return to_enum(:my_map) unless block_given?

    rezult = []
    index = 0
    while index < length
      rezult << self[index] if yield(self[index])
      index += 1
    end
    rezult
  end
end

class Array
  include MyMethod
end
