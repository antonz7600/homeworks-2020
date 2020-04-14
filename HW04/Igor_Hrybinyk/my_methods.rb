class Array
  def my_each
    return to_enum unless block_given?

    i = 0

    while i < size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_map
    return to_enum unless block_given?

    result = []
    i = 0

    while i < size
      result << yield(self[i])
      i += 1
    end
    result
  end

  def my_select
    return to_enum unless block_given?

    result = []
    i = 0

    while i < size
      result << self[i] if yield(self[i])
      i += 1
    end
    result
  end
end
