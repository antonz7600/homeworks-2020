# frozen_string_literal: true

# Custom array implementation
module CustomArray
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
  end

  def my_map(&block)
    result = []
    my_each do |element|
      result << block.call(element)
    end
    result
  end

  def my_select(&block)
    result = []
    my_each do |element|
      result << element if block.call(element) == true
    end
    result
  end
end
