require 'rails_helper'

RSpec.describe SerializerName do
  subject(:serializer) { described_class.new(contact, include: [:tags]).serializable_hash }

  context 'when a SerializerName is given' do
    let(:serializer) do
      created = FactoryBot.create(:serializer_name)

      created
    end

    it { expect(serializer[:data][:id]).not_to be_nil }

    context 'when serializer is serialized' do
      let(:attributes) { serializer[:data][:attributes] }
      let(:included) { serializer[:included] }

      it 'must have the required parameters' do
        expect(attributes.keys).to contain_exactly(
          :field_1, :field_2, :field_3, :field_4, :created_at, :updated_at
        )
      end

    end
  end
end
