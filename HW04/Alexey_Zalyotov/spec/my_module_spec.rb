require 'my_module'

class Array
  include MyModule
end

# rubocop:disable Metrics/BlockLength
RSpec.describe MyModule do
  describe '#my_each' do
    subject { Array.new(base_array).my_each(&block) }

    context 'when no block is given' do
      let(:block) {}

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it { is_expected.to be_a(Enumerator) }

        describe '#to_a' do
          it 'returns array [1, 2, 3]' do
            expect(subject.to_a).to match_array [1, 2, 3]
          end
        end
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to be_a(Enumerator) }

        describe '#to_a' do
          it 'returns an empty array' do
            expect(subject.to_a).to match_array []
          end
        end
      end
    end

    context 'when the block { ->(a) { puts a } } is given' do
      let(:block) { ->(a) { puts a } }

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it 'puts elements in STDOUT and returns array [1, 2, 3]' do
          expect { subject }.to output("1\n2\n3\n").to_stdout
          expect(subject).to match_array [1, 2, 3]
        end
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to match_array [] }
      end
    end

    context 'when the block { ->(a) { puts a * a } } is given' do
      let(:block) { ->(a) { puts a * a } }

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it 'puts changed elements in STDOUT and returns array [1, 2, 3]' do
          expect { subject }.to output("1\n4\n9\n").to_stdout
          expect(subject).to match_array [1, 2, 3]
        end
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to match_array [] }
      end
    end
  end

  describe '#my_map' do
    subject { Array.new(base_array).my_map(&block) }

    context 'when no block is given' do
      let(:block) {}

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it { is_expected.to be_a(Enumerator) }

        describe '#to_a' do
          it 'returns array [1, 2, 3]' do
            expect(subject.to_a).to match_array [1, 2, 3]
          end
        end
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to be_a(Enumerator) }

        describe '#to_a' do
          it 'returns an empty array' do
            expect(subject.to_a).to match_array []
          end
        end
      end
    end

    context 'when the block { ->(a) { a * 2 } } is given' do
      let(:block) { ->(a) { a * 2 } }

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it 'returns array [2, 4, 6]' do
          expect(subject).to match_array [2, 4, 6]
        end
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to match_array [] }
      end
    end

    context 'when the block { ->(a) { a.odd? } is given' do
      let(:block) { ->(a) { a.odd? } }

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it { is_expected.to match_array [true, false, true] }
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to match_array [] }
      end
    end
  end

  describe '#my_select' do
    subject { Array.new(base_array).my_select(&block) }

    context 'when no block is given' do
      let(:block) {}

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it { is_expected.to be_a(Enumerator) }

        describe '#to_a' do
          it 'returns array [1, 2, 3]' do
            expect(subject.to_a).to match_array [1, 2, 3]
          end
        end
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to be_a(Enumerator) }

        describe '#to_a' do
          it 'returns an empty array' do
            expect(subject.to_a).to match_array []
          end
        end
      end
    end

    context 'when the block { ->(a) { a < 3 } } is given' do
      let(:block) { ->(a) { a < 3 } }

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it { is_expected.to match_array [1, 2] }
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to match_array [] }
      end
    end

    context 'when the block { ->(a) { a.odd? } } is given' do
      let(:block) { ->(a) { a.odd? } }

      context 'when array is present' do
        let(:base_array) { [1, 2, 3] }

        it { is_expected.to match_array [1, 3] }
      end

      context 'when array is empty' do
        let(:base_array) { [] }

        it { is_expected.to match_array [] }
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
