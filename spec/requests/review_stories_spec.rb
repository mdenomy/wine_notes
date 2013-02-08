require 'spec_helper'

describe "ReviewStories" do
  describe "Add review" do

    before(:each) do
      @vino = Factory.create(:wine, producer: "Something Wines")
      visit wine_url @vino
      click_link "Add Review"
    end

    it "can save a review" do
       fill_in "Date", with: "02/11/12"
      fill_in "Summary", with: "Yummy"
      select "3", from: "Score"
      click_button "Save Review"
    end
  end
end
