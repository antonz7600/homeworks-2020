# my_class
class Array
  def my_each
    index = 0

    while index < length
      yield self[index]
      index += 1
    end
  end

  def my_map
    results = []

    each do |elem|
      results << yield(elem)
    end
    results
  end

  def my_select
    results = []

    each do |elem|
      results << elem if yield(elem) == true
    end
    results
  end
end
