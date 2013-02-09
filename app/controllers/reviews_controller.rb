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

  def show
    @review = Review.find_by_id(params[:id])
  end

  def edit
    @review = Review.find_by_id(params[:id])
    @wine = Wine.find_by_id(params[:wine_id])
  end

  def update
    @review = Review.find_by_id(params[:id])
    @wine = Wine.find_by_id(params[:wine_id])
    if @review.update_attributes(params[:review])
      redirect_to wine_path(@wine),
                  notice: 'Review was successfully updated.'
    else
      format.html { render action: "edit" }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to wine_path params[:wine_id]
    end

end
