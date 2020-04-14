module Custom
  def my_select
    return self unless block_given?

    i = 0
    arr = []
    while i < size
      arr << self[i] if yield(self[i])
      i += 1
    end
    arr
  end
end
