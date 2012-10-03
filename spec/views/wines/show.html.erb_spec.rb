require 'spec_helper'

describe "wines/show" do
  before(:each) do
    @wine = assign(:wine, stub_model(Wine,
      :producer => "Producer",
      :brand_name => "Brand Name",
      :year => 1,
      :grape_wine_name => "Grape Wine Name",
      :color => "Color",
      :classification => "Classification"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Producer/)
    rendered.should match(/Brand Name/)
    rendered.should match(/1/)
    rendered.should match(/Grape Wine Name/)
    rendered.should match(/Color/)
    rendered.should match(/Classification/)
  end

  it "renders a list of reviews" do

  end
end
