require 'rails_helper'

RSpec.describe Account, type: :model do
    context "Validacao" do
        it 'validar os campos de account ao salvar' do
            account = create(:account)
            expect(account).to be_valid 
        end
    
        it { is_expected.to validate_presence_of(:nome)}
        it { is_expected.to validate_presence_of(:email)}
        it { is_expected.to validate_presence_of(:cpf)}
        it { is_expected.to validate_presence_of(:password)}
        it { is_expected.to validate_presence_of(:telefone)}
    end

    context "Instancia de Metodo" do
        it 'return falso caso nao tenha saldo ' do
            account = create(:account)
            expect(account.veririficar_saldo_suficiente(10)).to be false
        end
        it 'return true caso tenha saldo' do
            account = create(:account)
            account.saldo = 1000
            expect(account.veririficar_saldo_suficiente(10)).to be true
        end
    end
    
end
