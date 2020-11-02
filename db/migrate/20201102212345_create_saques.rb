class CreateSaques < ActiveRecord::Migration[6.0]
  def change
    create_table :saques do |t|
      t.decimal :valor, precision: 8, scale: 2
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
