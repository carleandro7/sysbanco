require 'rails_helper'

RSpec.describe Saque, type: :model do
 
  context "Validacao" do
    it 'validar os campos de saque ao salvar' do
      account = create(:account, :saldo_conta)
      saque = create(:saque, account: account)
      expect(saque).to be_valid
    end

    it { is_expected.to validate_presence_of(:valor)}
    it { is_expected.to validate_presence_of(:account_id)}
    
    it 'Relacionamento saque e account'do
      account = create(:account, :saldo_conta)
      saque = create(:saque, account: account)
      expect(saque.account).to be_kind_of(Account)
    end
  end
end

