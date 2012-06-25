class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :producer
      t.string :brand_name
      t.integer :year
      t.string :grape_wine_name
      t.string :color
      t.string :classification

      t.timestamps
    end
  end
end
