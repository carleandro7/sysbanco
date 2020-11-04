require 'rails_helper'

RSpec.feature "Transfers", type: :feature do

  it 'Criar Transferencia' do
    #account vai enviar trasnferencia
    account = create(:account,:saldo_conta)
    #account vai receber trasnferencia
    account2 = create(:account)
    login_as(account, :scope => :account)
    visit(new_transfer_path)
    fill_in( "transfer[valor]", with:  Faker::Number.decimal(l_digits: 3))
    select(account2.nome, from: 'transfer[transferaccounts_attributes][0][account_id]')
    click_button("Transfer")
    expect(page).to have_content("Transferência Realizada") 
  end

  
end
