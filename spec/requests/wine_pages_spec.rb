require 'spec_helper'

describe "Wines" do

  subject { page }

  describe "GET /wines" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get wines_path
      response.status.should be(200)
    end
  end

  describe "details page" do

    let(:wine) { Factory.create(:wine) }
    let!(:review1) { Factory.create(:review, wine: wine, notes: "Mmm mmm good") }
    let!(:review2) { Factory.create(:review, wine: wine, notes: "Totally sucks") }

    before do
      visit wine_path(wine)
    end

    it { should have_selector('h1', text: wine.full_name) }

    describe "reviews" do
      it { should have_content(review1.notes) }
      it { should have_content(review2.notes) }
      it { should have_selector('h3', text: "2") }
    end
  end
end
