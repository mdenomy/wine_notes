require 'spec_helper'

describe "wines/index" do
  before(:each) do
    assign(:wines, [
      stub_model(Wine,
        :producer => "Producer",
        :brand_name => "Brand Name",
        :year => 1,
        :grape_wine_name => "Grape Wine Name",
        :color => "Color",
        :classification => "Classification"
      ),
      stub_model(Wine,
        :producer => "Producer",
        :brand_name => "Brand Name",
        :year => 1,
        :grape_wine_name => "Grape Wine Name",
        :color => "Color",
        :classification => "Classification"
      )
    ])
  end

  it "renders a list of wines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Producer".to_s, :count => 2
    assert_select "tr>td", :text => "Brand Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Grape Wine Name".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Classification".to_s, :count => 2
  end
end
