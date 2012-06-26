class AddWineRelationToReview < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.references  :wine
    end
    add_index :reviews, :wine_id
  end
end
