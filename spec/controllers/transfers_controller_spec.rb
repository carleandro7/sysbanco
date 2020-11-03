require 'rails_helper'

RSpec.describe TransfersController, type: :controller do
    context "Autorizacao de usuario autenticados" do
        it 'resposta 302 para usuario nao autenticado' do
            get :new
            expect(response).to have_http_status(302)
        end

        it 'resposta para usuario autenticado' do
            account = create(:account)
            sign_in account
            get :new
            expect(response).to have_http_status(200)
        end
    end
end

