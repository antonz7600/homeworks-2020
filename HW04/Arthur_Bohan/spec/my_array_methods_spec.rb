require_relative '../my_array_methods.rb'

describe Array do
  let(:empty_array) { [] }
  let(:array) { [1, 2, 3] }

  describe '#my_select' do
    context 'when select specific number from array' do
      let(:expected_result) { [1] }

      it 'returns a specific element from array' do
        expect(array.my_select { |elem| elem == 1 }).to eq expected_result
      end
    end

    context 'when select positive number from array' do
      let(:expected_result) { [1, 2, 3] }

      it 'returns full number from array' do
        expect(array.my_select(&:positive?)).to eq expected_result
      end
    end

    context 'when select an element outside bounds' do
      let(:expected_result) { [] }

      it 'returns clear array when select 0' do
        expect(array.my_select(&:zero?)).to eq expected_result
      end
    end

    context 'when select negative numbers' do
      let(:expected_result) { [] }

      it 'returns clear array' do
        expect(array.my_select(&:negative?)).to eq expected_result
      end
    end
  end

  describe '#my_map' do
    context 'when multiply elements' do
      it 'does somthing with all elements from array' do
        expect(array.my_map { |elem| elem * 2 }).to eq [2, 4, 6]
      end
    end

    context 'when exponentiate elements' do
      it 'does somthing with all elements from array' do
        expect(array.my_map { |elem| elem**2 }).to eq [1, 4, 9]
      end
    end
  end

  describe '#my_each' do
    let(:new_array) { [] }

    context 'when array has elements' do
      it 'sorts out elements and passed them to the block' do
        array.my_each { |elem| new_array << (elem - 1) }
        expect(new_array).to eq [0, 1, 2]
      end
    end

    context 'when array is empty' do
      let(:expected_result) { [] }

      it 'passed empty array to the block' do
        empty_array.my_each { |elem| new_array << (elem - 1) }
        expect(new_array).to eq expected_result
      end
    end
  end
end
