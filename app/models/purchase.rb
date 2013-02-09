class Purchase < ActiveRecord::Base
  attr_accessible :date, :price, :store

  validates :date, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :store, presence: true

  belongs_to  :wine

end
