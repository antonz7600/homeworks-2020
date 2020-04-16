<<<<<<< HEAD
<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> f3e4b569a5afcc0912545238b2e30b7db7661186
require_relative 'lib/array'

# it is JUST small test, all rspec tests are inside test folder

test = Array.new([42, 52, 52, 'aff'])
test = test.my_select { |x| x.class == Integer }
p test
p test.custom?
<<<<<<< HEAD
=======

>>>>>>> init: add task file
=======
>>>>>>> f3e4b569a5afcc0912545238b2e30b7db7661186
