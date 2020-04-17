# frozen_string_literal: true

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
      subject(:test_array) { described_class.new([2, 5]) }

      let(:test_output) do
        tmp_array = []
        test_array.my_each { |n| tmp_array << "Current number is: #{n}" }
        return tmp_array
      end

      let(:test_output_power) do
        tmp_array = []
        test_array.my_each do |n|
          tmp_array << "Second power of: #{n} is: #{n**2} "
        end
        return tmp_array
      end

      it 'prints: Current number is: X' do
        expect(test_output).to eq(expected_output)
      end

      it 'prints: Second power of: X is: X^2' do
        expect(test_output_power).to eq(expected_output_power)
      end
    end

    context 'when is given empty array' do
      subject(:test_array) { described_class.new([]) }

      let(:test_output) do
        tmp_array = []
        test_array.my_each { |n| tmp_array << "Current number is: #{n}" }
        return tmp_array
      end

      it 'selects nothing' do
        expect(test_output).to eq(expected_empty_output)
      end
    end
  end

  describe 'my_map' do
    let(:expected_output_add) { [2, 3, 4, 5] }
    let(:expected_output_multiply) { [5, 10, 15, 20] }

    context 'when is given non-empty array' do
      subject(:test_array) { described_class.new([1, 2, 3, 4]) }

      let(:test_output_add) do
        test_array.my_map do |n|
          n + 1
        end
      end

      let(:test_output_multiply) do
        test_array.my_map do |n|
          n * 5
        end
      end

      it 'increses value by 1' do
        expect(test_output_add).to eq(expected_output_add)
      end

      it 'multiplies value in 5 times' do
        expect(test_output_multiply).to eq(expected_output_multiply)
      end
    end

    context 'when is given empty array' do
      subject(:test_array) { described_class.new([]) }

      let(:test_output) do
        test_array.my_map do |n|
          n + 1
        end
      end

      it 'selects nothing' do
        expect(test_output).to eq(expected_empty_output)
      end
    end
  end

  describe 'my_select' do
    let(:expected_output_numbers) { [1, 5, 8, 3, 24, 574] }
    let(:expected_output_big_numbers) { [574] }

    context 'when is given non-empty array' do
      subject(:test_array) do
        described_class.new([1, 5, 8, 3, 24, 574, 'fasf', true, 'exc'])
      end

      let(:test_output_numbers) do
        test_array.my_select do |n|
          n.class == Integer
        end
      end

      let(:test_output_big_numbers) do
        test_array.my_select do |n|
          (n.class == Integer) && (n > 300)
        end
      end

      it 'selects only numbers' do
        expect(test_output_numbers).to eq(expected_output_numbers)
      end

      it 'selects numbers > 300' do
        expect(test_output_big_numbers).to eq(expected_output_big_numbers)
      end
    end

    context 'when is given empty array' do
      subject(:test_array) { described_class.new([]) }

      let(:test_output) do
        test_array.my_select do |n|
          n.class == Integer
        end
      end

      it 'selects nothing' do
        expect(test_output).to eq(expected_empty_output)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
