require 'rails_helper'

RSpec.describe ModelName, type: :model do
  describe 'configurations' do
    it { is_expected.to be_mongoid_document }
    it { is_expected.to have_timestamps }
  end

  describe 'schema fields' do
    it { is_expected.to have_field(:field_1).of_type(String) }
    it { is_expected.to have_field(:field_2).of_type(String) }
    it { is_expected.to have_field(:field_3).of_type(String) }
    it { is_expected.to have_field(:field_4).of_type(String) }
  end

  describe 'indexes' do
    it { is_expected.to have_index_for(field_1: 1) }
    it { is_expected.to have_index_for(field_2: 1) }
    it { is_expected.to have_index_for(field_3: 1, field_4: 1).with_options(background: true) }
    it { is_expected.to have_index_for(field_4: 1, field_3: 1).with_options(background: true) }
  end
end
