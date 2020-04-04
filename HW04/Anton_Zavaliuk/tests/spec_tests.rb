require 'rspec'
require '/home/antonz/Ruby/homeworks-2020/HW04/Anton_Zavaliuk/lib/array'

describe Array do
  it "my_each each is printing like: 'Current number is: X'" do
    items = Array.new([2, 5])
    test_output = []
    items.my_each { |n| test_output << "Current number is: #{n}" }

    expect(test_output).to eq(['Current number is: 2', 'Current number is: 5'])
  end

  it 'my_map map += 1' do
    items = Array.new([1, 2, 3, 4])
    result = items.my_map do |n|
      n + 1
    end

    expect(result).to eq([2, 3, 4, 5])
  end

  it 'my_select select only numbers' do
    items = Array.new([1, 5, 8, 3, 24, 574, 'fasf', true, 'exc'])
    result = items.my_select do |n|
      n.class == Integer
    end

    expect(result).to eq([1, 5, 8, 3, 24, 574])
  end
end
