class AddWineIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :wine_id, :integer
  end
end
