# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/BlockLength
require_relative '../lib/my_method'

RSpec.describe Array do
  subject { described_class.new([1, 2, 3, 4]) }

  describe '#my_each' do
    context 'when the block is not given' do
      it { expect(subject.my_each).to be_an(Enumerator) }
    end

    context 'when the block is given' do
      let(:expection) { [] }

      it 'calls the given block once for each element' do
        expect { |block| subject.my_each(&block) }.to yield_control.exactly(4).times
      end

      it 'execute block' do
        subject.my_each { |element| expection << element * 3 }
        expect(expection).to eql([3, 6, 9, 12])
      end

      it 'returns itself' do
        expect(subject.my_each { |element| element * 3 }).to eql(subject)
      end
    end
  end

  describe '#my_map' do
    context 'when the block is not given' do
      it { expect(subject.my_map).to be_an(Enumerator) }
    end

    context 'when the block is given' do
      it 'calls the given block once for each element' do
        expect { |block| subject.my_map(&block) }.to yield_control.exactly(4).times
      end

      it 'execute block  and returns new array' do
        expect(subject.my_map { |element| element * 3 }).to eql([3, 6, 9, 12])
      end
    end
  end

  describe '#my_select' do
    context 'when the block is not given' do
      it { expect(subject.my_select).to be_an(Enumerator) }
    end

    context 'when the block is given' do
      it 'calls the given block once for each element' do
        expect { |block| subject.my_select(&block) }.to yield_control.exactly(4).times
      end

      it 'execute block and returns new array' do
        expect(subject.my_select(&:even?)).to eql([2, 4])
      end
    end
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable  Metrics/BlockLength
