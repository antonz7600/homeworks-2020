module Custom
  def my_each
    i = 0
    while i < size
      yield(self[i]) if block_given?
      i += 1
    end
    self
  end
end
