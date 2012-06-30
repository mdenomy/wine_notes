class Wine < ActiveRecord::Base
  attr_accessible :brand_name, :classification, :color, :grape_wine_name, :producer, :year

  validates :producer,    presence: true
  validates :brand_name,  presence: true

  has_many  :reviews

  def full_name
    "#{year} #{producer} #{brand_name}"
  end
end
