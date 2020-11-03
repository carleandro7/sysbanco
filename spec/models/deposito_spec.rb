require 'rails_helper'

RSpec.describe Deposito, type: :model do
  context "Validacao" do
    it 'validar os campos de depositos ao salvar' do
        deposito = create(:deposito)
        expect(deposito).to be_valid 
    end

    it { is_expected.to validate_presence_of(:valor)}
    it { is_expected.to validate_presence_of(:account_id)}
    
    it 'Relacionamento deposito e account'do
      deposito = create(:deposito)
      expect(deposito.account).to be_kind_of(Account)
    end

  end  
end
