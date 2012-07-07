class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @wine = Wine.find_by_id(params[:wine_id])
  end

  def create
    @wine = Wine.find_by_id(params[:wine_id])
    @review = @wine.reviews.build(params[:review])
    @review.save
    redirect_to wine_path(@wine)
  end
end
