class PurchasesController < ApplicationController

  def create
    @wine = Wine.find_by_id(params[:wine_id])
    @purchase = @wine.purchases.build(params[:purchase])
    if @purchase.save
      redirect_to wine_path(@wine)
    else
      render :new
    end
  end
end
