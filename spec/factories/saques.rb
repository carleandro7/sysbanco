FactoryBot.define do
    factory :saque do 
        valor {Faker::Number.decimal(l_digits: 2)}
        account
    end
end