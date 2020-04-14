require_relative '../my_methods.rb'

RSpec.describe Array do
  let(:test_array) { described_class.new([1, 2, 3, 4, 5]) }

  describe '#my_each' do
    let(:empty_array) { [] }

    context 'when block is given' do
      before { test_array.my_each { |elem| empty_array << elem + 1 } }

      it 'returns the same values as the default each method' do
        expect(empty_array).to eql([2, 3, 4, 5, 6])
      end

      it 'returns array with the same object id' do
        expect(test_array.my_each { |v| v }.object_id)
          .to eql(test_array.object_id)
      end
    end

    context 'when block is not given' do
      it 'works with Enumerator class' do
        expect(test_array.my_each).to be_a(Enumerator)
      end
    end

    context 'when array is empty' do
      it 'returns an empty array' do
        expect(empty_array.my_each { |v| v + 1 }).to eql([])
      end
    end
  end
end
