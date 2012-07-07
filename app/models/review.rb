class Review < ActiveRecord::Base
  attr_accessible :date, :notes, :score, :summary

  validates :date,  presence:     true
  validates :score, presence:     true,
                    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to  :wine
  has_one     :user

  default_scope order: 'reviews.date DESC'

end

