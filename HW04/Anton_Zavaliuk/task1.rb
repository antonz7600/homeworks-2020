# frozen_string_literal: true

require_relative 'lib/array'

# it is JUST small test, all rspec tests are inside test folder

test = Array.new([42, 52, 52, 'aff'])
test = test.my_select { |x| x.class == Integer }
p test
p test.custom?
