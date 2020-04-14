require_relative 'my_methods.rb'

def indent_line
  puts
end

array = [1, 2, 3, 4, 5]
array.my_each { |elem| puts elem + 1 }
indent_line

map_result = array.my_map { |elem| elem * 2 }
print map_result
indent_line

select_result = array.my_select(&:odd?)
p select_result
