require 'rails_helper'

RSpec.describe SaquesController, type: :controller do
    context "Autorizacao de usuario autenticados" do
        it 'resposta 302 para usuario nao autenticado ao new' do
            get :new
            expect(response).to have_http_status(302)
        end

        it 'resposta para usuario autenticado ao new' do
            account = create(:account)
            sign_in account
            get :new
            expect(response).to have_http_status(200)
        end

        it 'resposta 302 para usuario nao autenticado ao show' do
            account = create(:account, :saldo_conta)
            saque = create(:saque, account: account)
            get :show, params: {id: saque.id}
            expect(response).to have_http_status(302)
        end

        it 'resposta para usuario autenticado ao show' do
            account = create(:account, :saldo_conta)
            sign_in account
            saque = create(:saque, account: account)
            get :show, params: {id: saque.id}
            expect(response).to have_http_status(200)
        end
    end
end

