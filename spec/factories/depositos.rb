FactoryBot.define do
    factory :deposito do 
        valor {Faker::Number.decimal(l_digits: 2)}
        account
    end
end