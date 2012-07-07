module ReviewsHelper
  def review_title(wine)
     wine.full_name unless wine.nil?
  end
end
