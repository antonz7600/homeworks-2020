require_relative 'lib/my_module'

class Array
  include MyModule
end

my_arr = Array.new([1, 2, 3])

puts 'Modified elements, each with a new line:'
my_arr.my_each do |element|
  puts element
end
puts

puts 'Array with modified elements:'
output = my_arr.my_map { |element| element * 2 }
p output
puts

puts 'Array with elements selected according to the condition:'
output = my_arr.my_select { |element| element < 3 }
p output
