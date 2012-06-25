class Wine < ActiveRecord::Base
  attr_accessible :brand_name, :classification, :color, :grape_wine_name, :producer, :year
end
