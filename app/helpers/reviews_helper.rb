module ReviewsHelper
  def review_title(wine)
     "Review of " + wine.full_name unless wine.nil?
  end
end
