RSpec.describe Doctor do
  describe 'associations' do
    it { is_expected.to have_many(:appointments).dependent(:destroy) }
    it { is_expected.to have_many(:patients).through(:appointments).dependent(:destroy) }
    it { is_expected.to belong_to(:category) }
  end

  describe 'validations' do
    context 'with presence validation' do
      %i[first_name last_name phone password].each do |field|
        it { is_expected.to validate_presence_of(field) }
      end
    end

    context 'with phone regex validation' do
      subject(:doctor) { described_class.new }

      let(:valid_phones) { ['+380997357090', '+380664356055'] }
      let(:invalid_phones) { ['0997357090', '380987357090', '+38063455'] }

      it 'check valid values' do
        expect(doctor).to allow_values(*valid_phones).for(:phone)
      end

      it 'check invalid values' do
        expect(doctor).not_to allow_values(*invalid_phones).for(:phone)
      end
    end
  end
end
