require 'rails_helper'

RSpec.feature "Saques", type: :feature do

  it 'Criar Saque' do
    account = create(:account,:saldo_conta)
    login_as(account, :scope => :account)
    visit(new_saque_path)
    fill_in( "saque[valor]", with: Faker::Number.decimal(l_digits: 3))
    click_button("Efetivar")
    expect(page).to have_content("Saque Realizado") 

  end
  it 'Visitar Saque com usuario nao logado' do
    visit(new_saque_path)
    expect(page).to have_current_path(new_account_session_path)  
  end
  
end
