require_relative '../my_methods.rb'

RSpec.describe Array do
  let(:test_array) { described_class.new([1, 2, 2, 3]) }

  describe '#my_select' do
    context 'when block is given' do
      it 'outputs eql to default select values' do
        expect(test_array.my_select { |v| v == 2 })
          .to eql(test_array.select { |v| v == 2 })
      end
    end

    context 'when block is not given' do
      it 'works with Enumerator class' do
        expect(Enumerator).to be(test_array.my_select.class)
      end
    end

    context 'when array is empty' do
      let(:empty_array) { [] }

      it 'returns an empty array' do
        expect(empty_array.my_each { |v| v == 2 }).to eql([])
      end
    end
  end
end
