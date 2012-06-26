class AddUserRelationToReview < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.references  :user
    end
    add_index :reviews, :user_id
  end
end
