RSpec.shared_examples 'v1.module_name.contract_name.all_fields' do |opts = {}|
  context 'when all params are missing' do
    let(:params) do
      if opts[:is_update]
        %i[
          first_name
          last_name
          email
          phone
          epj
          status
          company
          street
          zip
          city
          country_code
          locale
          allow_contacting
        ].index_with { |_k| '' }
      else
        {}
      end
    end

    it {
      expect(contract.call(params).errors.filter(:base?).map(&:to_s)).to containing_exactly('at least one field must be filled')
    }
  end
end

RSpec.shared_examples 'v1.module_name.contract_name.field_1' do |_parameter|
  context 'when the field_1 is not an expected value' do
    it { expect(contract.call({ field_1: 'email' }).errors.to_h[:field_1]).to eq(['not a valid email format']) }
    it { expect(contract.call({ field_1: '' }).errors.to_h[:field_1]).to eq(nil) }
    it { expect(contract.call({ field_1: nil }).errors.to_h[:field_1]).to eq(['must be a string']) }
    it { expect(contract.call({ field_1: 2 }).errors.to_h[:field_1]).to eq(['must be a string']) }
  end

  context 'when the field_1 has an expected value' do
    it 'the string must be stripped' do
      expect(contract.call({ field_1: ' test@test.fr        ' }).to_h[:field_1]).to eq('test@test.fr')
    end
  end
end
