require_relative '../my_methods.rb'

RSpec.describe Array do
  let(:test_array) { described_class.new([1, 2, 3, 4, 5]) }

  describe '#my_map' do
    context 'when block is given' do
      it 'returns the same values as the default map method' do
        expect(test_array.my_map { |v| v + 1 })
          .to eql(test_array.map { |v| v + 1 })
      end

      it 'returns new array with unique object id' do
        expect(test_array.my_map { |v| v }.object_id)
          .not_to eql(test_array.object_id)
      end
    end

    context 'when block is not given' do
      it 'works with Enumerator class' do
        expect(Enumerator).to be(test_array.my_map.class)
      end
    end

    context 'when array is empty' do
      let(:empty_array) { [] }

      it 'returns an empty array' do
        expect(empty_array.my_each { |v| v + 1 }).to eql([])
      end
    end
  end
end
