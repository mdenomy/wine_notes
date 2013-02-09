require 'spec_helper'

describe PurchasesController do

  def valid_attributes
    {price: "19.99", store: "Fred's Discount Wines", date: "2012-01-02"}
  end

  before(:each) do
    @wine = Factory.create(:wine)
  end


  describe "GET index" do
    it "gets the purchases" do
      get :index, wine_id: @wine
      assigns(:purchases).should_not be_nil
    end
  end

  describe "GET new" do
    it "assigns a newly created purchase" do
      get :new, wine_id: @wine
      assigns(:purchase).should be_a(Purchase)
    end

  end


  describe "POST create" do
    describe "with valid params" do
      it "creates a new purchase" do
        expect {
          post :create, wine_id: @wine, purchase: valid_attributes
        }.to change(Purchase, :count).by(1)
      end

      it "assigns a newly created wine as @wine" do
        post :create, wine_id: @wine, purchase: valid_attributes
        assigns(:purchase).should be_a(Purchase)
        assigns(:purchase).should be_persisted
      end

      it "redirects to the wine it belongs to " do
        post :create, wine_id: @wine, purchase: valid_attributes
        response.should redirect_to(@wine)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved purchase as @purchase" do
        # Trigger the behavior that occurs when invalid params are submitted
        Purchase.any_instance.stub(:save).and_return(false)
        post :create, wine_id: @wine, purchase: {}
        assigns(:purchase).should be_a_new(Purchase)
      end

      it "re-renders the 'new' template on save error" do
        # Trigger the behavior that occurs when invalid params are submitted
        Wine.any_instance.stub(:save).and_return(false)
        post :create, wine_id: @wine, purchase: {}
        response.should render_template("new")
      end
    end
  end
end
