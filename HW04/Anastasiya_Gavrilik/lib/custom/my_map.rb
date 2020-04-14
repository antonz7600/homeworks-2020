module Custom
  def my_map
    return self unless block_given?

    i = 0
    arr = []
    while i < size
      arr << yield(self[i])
      i += 1
    end
    arr
  end
end
