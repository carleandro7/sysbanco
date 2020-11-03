FactoryBot.define do
    factory :account do 
        nome {Faker::Name.name}
        email {"carleando7@gmail.com"}
        telefone {Faker::PhoneNumber.cell_phone}
        cpf {Faker::PhoneNumber.cell_phone}
        password {"123456"}  

        trait :saldo_conta do
            saldo {1000}
        end
    end 
end