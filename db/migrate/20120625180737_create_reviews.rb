class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.datetime :date
      t.text :notes
      t.integer :score

      t.timestamps
    end
  end
end
