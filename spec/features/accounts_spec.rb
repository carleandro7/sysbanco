require 'rails_helper'

RSpec.feature "Accounts", type: :feature do
  it 'Visitar o menu 'do
    visit(menu_accounts_path)
    expect(page).to have_current_path(menu_accounts_path)  
  end

  it 'Criar Account' do
    visit(new_account_path)
    fill_in( "Nome",	with:  Faker::Name.name)
    fill_in( "Telefone",	with:  Faker::PhoneNumber.cell_phone)
    fill_in( "CPF",	with:  Faker::PhoneNumber.cell_phone)
    fill_in( "Email",	with:  Faker::Internet.email)
    fill_in( "Senha",	with:  "123456")
    click_button("Salvar")
    expect(page).to have_current_path(menu_accounts_path) 

  end
  it 'Visitar Extrato com usuario logado' do
    account = create(:account)
    login_as(account, :scope => :account)
    visit(extratoconta_accounts_path)
    expect(page).to have_content("Lançamento")  
  end
  it 'Visitar Extrato com usuario nao logado' do
    visit(extratoconta_accounts_path)
    expect(page).to have_current_path(new_account_session_path)  
  end

  it 'Encerra conta de usuario logado' do
    account = create(:account)
    login_as(account, :scope => :account)
    visit(encerrarconta_accounts_path)
    expect(page).to have_current_path(menu_accounts_path)  
  end

  it 'Editar Account usuario logado' do
    account = create(:account)
    login_as(account, :scope => :account)
    visit(edit_account_path(account))
    fill_in( "Nome",	with:  Faker::Name.name)
    fill_in( "Telefone",	with:  Faker::PhoneNumber.cell_phone)
    fill_in( "CPF",	with:  Faker::PhoneNumber.cell_phone)
    fill_in( "Email",	with:  Faker::Internet.email)
    fill_in( "Senha",	with:  "123456")
    click_button("Salvar")
    expect(page).to have_current_path(new_account_session_path) 
  end
end
