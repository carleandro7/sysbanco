class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.decimal :valor
      t.decimal :taxa

      t.timestamps
    end
  end
end
