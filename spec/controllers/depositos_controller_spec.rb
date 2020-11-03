require 'rails_helper'

RSpec.describe DepositosController, type: :controller do
    context 'responsa ao new bem sucessido' do
        it 'resposta new' do
            get :new
            expect(response).to  have_http_status(200)  
        end
    end
end

