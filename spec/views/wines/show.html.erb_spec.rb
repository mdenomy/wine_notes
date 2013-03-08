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

  it "renders attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Producer/)
    rendered.should match(/Brand Name/)
    rendered.should match(/1/)
    rendered.should match(/Grape Wine Name/)
    rendered.should match(/Color classification wine/)
  end

  it "has a link to record a purchase" do
    render
    assert_select "a[href$=#{new_wine_purchase_path(@wine.id)}]", :text => "Record Purchase"
  end
end
