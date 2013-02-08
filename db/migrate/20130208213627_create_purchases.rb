class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :date
      t.string :store
      t.decimal :price

      t.timestamps
    end
  end
end
