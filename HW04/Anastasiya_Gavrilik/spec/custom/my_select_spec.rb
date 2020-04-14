RSpec.describe Custom do
  describe '#my_select' do
    let(:arr) { [1, 2, 3] }

    before { Array.include(described_class) }

    context 'when empty block given' do
      subject { arr.my_select }

      it { is_expected.to eq arr }
    end

    context 'when block given' do
      subject { arr.my_select(&:odd?) }

      let(:expected_arr) { [1, 3] }

      it { is_expected.to eq expected_arr }
    end
  end
end
