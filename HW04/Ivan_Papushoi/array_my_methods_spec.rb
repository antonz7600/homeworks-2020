# frozen_string_literal: true

require_relative 'ivan_papushoi_hw04.rb'
require 'rspec/autorun'

RSpec.describe Array do
  describe '#my_select' do
    subject { array.my_select(&term) }

    context 'with array and odd? method' do
      let(:array) { [1, 2, 3, 4, 5, 6] }
      let(:term) { ->(x) { x.odd? } }
      let(:expectation) { [1, 3, 5] }

      it { is_expected.to eq(expectation) }
    end

    context 'when selecting negatives from random array' do
      let(:array) { described_class.new(20) { rand(-100..100) } }
      let(:term) { ->(x) { x.negative? } }

      it { is_expected.to eq(array.select(&term)) }
    end
  end

  describe '#my_each' do
    subject { array.my_each(&term) }

    context 'when method printing each value in stdout' do
      let(:expectation) { 'value 1 value 2 value 3 ' }
      let(:term) { ->(x) { print "value #{x} " } }
      let(:array) { [1, 2, 3] }

      it { expect { array.my_each(&term) }.to output(expectation).to_stdout }
    end

    context 'when return each value from array' do
      let(:array) { [1, 2, 3] }
      let(:term) { ->(x) { x } }
      let(:expectation) { [1, 2, 3] }

      it { is_expected.to eq(expectation) }
    end
  end

  describe '#my_map' do
    subject { array.my_map(&term) }

    context 'when method multiply each value' do
      let(:array) { [1, 2, 3] }
      let(:term) { ->(x) { x * 2 } }
      let(:expectation) { [2, 4, 6] }

      it { is_expected.to eq(expectation) }
    end

    context 'when method transform each string' do
      let(:array) { [' thIs', 'is', ' SOME  ', "words \n"] }
      let(:term) { ->(x) { x.downcase.chomp.strip } }

      it { is_expected.to eq(array.map(&term)) }
    end
  end
end
