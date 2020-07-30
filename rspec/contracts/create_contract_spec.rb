require 'rails_helper'

RSpec.describe V1::ModuleName::ContractName, type: %i[dry-validation] do
  subject(:contract) { described_class.new }
  
  include_examples 'v1.module_name.contract_name.all_fields'
  include_examples 'v1.module_name.contract_name.field_1'
  include_examples 'v1.module_name.contract_name.field_2'
  include_examples 'v1.module_name.contract_name.field_3'
  include_examples 'v1.module_name.contract_name.nested_field', action: :create
end
