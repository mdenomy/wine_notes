class WinesController < ApplicationController
  # GET /wines
  # GET /wines.json
  def index
    @wines = Wine.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /wines/1
  # GET /wines/1.json
  def show
    @wine = Wine.find(params[:id])
    @reviews = @wine.reviews.paginate(page: params[:page], :per_page => 5)
    @purchases = @wine.purchases.paginate(page: params[:page], :per_page => 3)
  end

  # GET /wines/new
  # GET /wines/new.json
  def new
    @wine = Wine.new
  end

  # GET /wines/1/edit
  def edit
    @wine = Wine.find(params[:id])
  end

  # POST /wines
  # POST /wines.json
  def create
    @wine = Wine.new(params[:wine])

    if @wine.save
      redirect_to @wine, notice: 'Wine was successfully created.'
    else
      render action: "new"
    end
  end

# PUT /wines/1
# PUT /wines/1.json
  def update
    @wine = Wine.find(params[:id])

    if @wine.update_attributes(params[:wine])
      redirect_to @wine, notice: 'Wine was successfully updated.'
    else
      render action: "edit"
    end
  end

# DELETE /wines/1
# DELETE /wines/1.json
  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_url
  end
end

