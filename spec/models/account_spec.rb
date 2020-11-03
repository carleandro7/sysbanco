require 'rails_helper'

RSpec.describe Account, type: :model do
    fixtures :accounts
    it 'Criar uma account' do
        account = accounts(:carleandro)
        expect(account.nome).to eq("carleandro")  
    end
end
