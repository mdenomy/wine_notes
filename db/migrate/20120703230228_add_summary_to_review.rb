class AddSummaryToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :summary, :text
  end
end
