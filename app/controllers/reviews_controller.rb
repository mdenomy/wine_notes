class ReviewsController < ApplicationController
  def new
    debugger
    @review = Review.new
    @wine = Wine.find_by_id(params[:wine_id])
  end

  def create
    debugger
    @wine = Wine.find_by_id(params[:wine_id])
    @review = @wine.reviews.build(params[:review])
    @review.save
    redirect_to wine_path(@wine)
  end
end
