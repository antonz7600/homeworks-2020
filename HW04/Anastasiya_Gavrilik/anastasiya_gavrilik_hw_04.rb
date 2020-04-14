$LOAD_PATH.unshift(__dir__ + '/../lib')
require_relative './lib/config'

arr = [1, 2, 3]
arr.my_each { |el| el**2 }
arr.my_map { |el| el**2 }
arr.my_select(&:odd?)
