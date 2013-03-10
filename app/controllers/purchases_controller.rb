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
    logger.info "Creating a purchase for wine #{@wine.full_name}"
    @purchase = @wine.purchases.build(params[:purchase])
    if @purchase.save
      redirect_to wine_path(@wine)
    else
      logger.error "Failed to save the purchase #{@purchase.inspect} for wine #{@wine.full_name}"
      render :new
    end
  end

  def edit
    @purchase = Purchase.find_by_id(params[:id])
    @wine = Wine.find_by_id(params[:wine_id])
  end

  def update
    @purchase = Purchase.find_by_id(params[:id])
    @wine = Wine.find_by_id(params[:wine_id])
    if @purchase.update_attributes(params[:purchase])
      redirect_to wine_purchases_path(@wine),
                  notice: 'Purchase was successfully updated.'
    else
      format.html { render action: "edit" }
    end
  end
  def destroy
    @wine = Wine.find_by_id(params[:wine_id])
    @purchase = Purchase.find_by_id(params[:id])
    @purchase.destroy
    redirect_to wine_purchases_path(@wine)
    end
end
