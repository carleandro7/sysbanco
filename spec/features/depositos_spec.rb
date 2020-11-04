require 'rails_helper'

RSpec.feature "Depositos", type: :feature do

  it 'Criar Deposito' do
    account = create(:account,:saldo_conta)
    visit(new_deposito_path)
    fill_in( "deposito[valor]", with:  Faker::Number.decimal(l_digits: 3))
    select(account.nome, from: 'deposito[account_id]')
    click_button("Enviar")
    expect(page).to have_content("Depósito Realizado") 
  end

  
end
