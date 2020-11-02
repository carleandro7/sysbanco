class CreateTransferaccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :transferaccounts do |t|
      t.string :operacao
      t.references :transfer, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
