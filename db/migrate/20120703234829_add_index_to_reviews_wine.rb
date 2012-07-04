class AddIndexToReviewsWine < ActiveRecord::Migration
  def change
    add_index :reviews, [:wine_id, :date]
  end
end
