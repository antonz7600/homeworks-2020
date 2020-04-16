<<<<<<< HEAD
require_relative 'custom_array'

=======
# frozen_string_literal: true

require_relative 'custom_array'

# Custom array add
>>>>>>> f3e4b569a5afcc0912545238b2e30b7db7661186
class Array
  include CustomArray
  def custom?
    true
  end
end
