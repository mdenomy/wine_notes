require 'spec_helper'

describe "wines/edit" do
  before(:each) do
    @wine = assign(:wine, stub_model(Wine,
      :producer => "MyString",
      :brand_name => "MyString",
      :year => 1,
      :grape_wine_name => "MyString",
      :color => "MyString",
      :classification => "MyString"
    ))
  end

  it "renders the edit wine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wines_path(@wine), :method => "post" do
      assert_select "input#wine_producer", :name => "wine[producer]"
      assert_select "input#wine_brand_name", :name => "wine[brand_name]"
      assert_select "input#wine_year", :name => "wine[year]"
      assert_select "input#wine_grape_wine_name", :name => "wine[grape_wine_name]"
      assert_select "input#wine_color", :name => "wine[color]"
      assert_select "input#wine_classification", :name => "wine[classification]"
    end
  end
end
