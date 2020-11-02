class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :nome
      t.string :telefone
      t.string :cpf
      t.decimal :saldo, precision: 8, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
