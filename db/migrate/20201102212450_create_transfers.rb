class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.decimal :valor, precision: 8, scale: 2
      t.decimal :taxa, precision: 8, scale: 2

      t.timestamps
    end
  end
end
