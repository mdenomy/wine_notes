class PurchasesController < ApplicationController

  def new
     @purchase = Purchase.new
     @wine = Wine.find_by_id(params[:wine_id])
  end

  def index
    @wine = Wine.find_by_id(params[:wine_id])
    @purchases = @wine.purchases.paginate(page: params[:page], :per_page => 5)
  end

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
