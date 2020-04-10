# rubocop:disable Metrics/BlockLength
require 'rspec'
require '/home/antonz/Ruby/homeworks-2020/HW04/Anton_Zavaliuk/lib/array'

describe(Array) do
  let(:expected_empty_output) { [] }
  let(:test_output) { [] }
  describe 'my_each' do
    let(:expected_output) { ['Current number is: 2', 'Current number is: 5'] }
    let(:expected_output_power) do
      ['Second power of: 2 is: 4 ', 'Second power of: 5 is: 25 ']
    end

    context 'when is given non-empty array' do
      subject { Array.new([2, 5]) }

      it 'expected: Current number is: X' do
        subject.my_each { |n| test_output << "Current number is: #{n}" }
        expect(test_output).to eq(expected_output)
      end

      it 'expected: Second power of: X is: X^2' do
        subject.my_each do |n|
          test_output << "Second power of: #{n} is: #{n**2} "
        end
        expect(test_output).to eq(expected_output_power)
      end
    end

    context 'when is given empty array' do
      subject { Array.new([]) }

      it 'expected: []' do
        subject.my_each { |n| test_output << "Current number is: #{n}" }
        expect(test_output).to eq(expected_empty_output)
      end
    end
  end

  describe 'my_map' do
    let(:expected_output_add) { [2, 3, 4, 5] }
    let(:expected_output_multiply) { [5, 10, 15, 20] }

    context 'when is given non-empty array' do
      subject { Array.new([1, 2, 3, 4]) }
      it 'expected: incresed value by 1' do
        test_output = subject.my_map do |n|
          n + 1
        end
        expect(test_output).to eq(expected_output_add)
      end

      it 'expected: multiplied value in 5 times' do
        test_output = subject.my_map do |n|
          n * 5
        end
        expect(test_output).to eq(expected_output_multiply)
      end
    end

    context 'when is given empty array' do
      subject { Array.new([]) }
      it 'expected: []' do
        test_output = subject.my_map do |n|
          n + 1
        end
        expect(test_output).to eq(expected_empty_output)
      end
    end
  end

  describe 'my_select' do
    let(:expected_output_numbers) { [1, 5, 8, 3, 24, 574] }
    let(:expected_output_big_numbers) { [574] }

    context 'when is given non-empty array' do
      subject { Array.new([1, 5, 8, 3, 24, 574, 'fasf', true, 'exc']) }
      it 'expected: selected only numbers' do
        test_output = subject.my_select do |n|
          n.class == Integer
        end
        expect(test_output).to eq(expected_output_numbers)
      end

      it 'expected: selected numbers > 300' do
        test_output = subject.my_select do |n|
          (n.class == Integer) && (n > 300)
        end
        expect(test_output).to eq(expected_output_big_numbers)
      end
    end

    context 'when is given empty array' do
      subject { Array.new([]) }
      it 'expected: []' do
        test_output = subject.my_select do |n|
          n.class == Integer
        end
        expect(test_output).to eq(expected_empty_output)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
