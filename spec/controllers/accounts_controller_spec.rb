require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
    context "Autorizacao de usuario autenticados" do
        it 'resposta 302 para usuario nao autenticado' do
            get :index
            expect(response).to have_http_status(302)  
        end
        it 'acesso ao show usuario nao logado' do
            account = create(:account)
            get :show, params: {id: account.id}
            expect(response).to have_http_status(302)  
        end
        it 'resposta para usuario autenticado' do
            account = create(:account)
            sign_in account
            get :index
            expect(response).to have_http_status(200)  
        end
        it 'acesso ao show' do
            account = create(:account)
            sign_in account
            get :show, params: {id: account.id}
            expect(response).to have_http_status(200)  
        end

        it 'acesso ao extrato da conta do usuario nao logado' do
            get :extratoconta
            expect(response).to have_http_status(302)
        end

        it 'acesso ao extrato da conta do usuario logado' do
            account = create(:account)
            sign_in account
            get :extratoconta
            expect(response).to have_http_status(200)
        end
    end
    context 'acesso ao menu principal nao logado' do
        it 'resposta para usuario autenticado' do
            get :menu
            expect(response).to have_http_status(200)  
        end
    end
end

