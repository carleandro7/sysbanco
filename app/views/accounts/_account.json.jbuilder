json.extract! account, :id, :nome, :telefone, :cpf, :saldo, :status, :created_at, :updated_at
json.url account_url(account, format: :json)
