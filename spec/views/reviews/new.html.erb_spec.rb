require 'spec_helper'

describe "reviews/new" do
  let(:wine) { Factory.create(:wine)}

  before(:each) do
    assign(:review, stub_model(Review,
      :notes => "MyString",
      :date => DateTime.civil(2012, 2, 3),
      :score => 2,
      :summary => "Wow"
    ).as_new_record)
  end

  it "renders new review form" do
    render  wine_reviews_path([:wine, :review])

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => wine_reviews_path(@review), :method => "post" do
    assert_select "textarea#review_summary", :name => "review[summary]"
    assert_select "textarea#review_notes", :name => "review[notes]"
    assert_select "input#review_date", :name => "review[date]"
    assert_select "select#score", :name => "review[score]"
    end
  end
end
