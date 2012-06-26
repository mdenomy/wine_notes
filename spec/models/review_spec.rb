require 'spec_helper'

describe Review do
  let(:wine) { Factory.create(:wine)}
  let(:user) { Factory.create(:user)}

  before do
    @review = Review.new(score: 3, date: DateTime.now)
  end

  subject { @review }

  it { should respond_to(:date) }
  it { should respond_to(:notes) }
  it { should respond_to(:score) }
  it { should respond_to(:wine)}
  it { should respond_to(:user)}

  describe "score not present" do
    before { @review.score = nil }
    it { should_not be_valid }
  end

  describe "score too low" do
    before { @review.score = 0 }
    it { should_not be_valid }
  end

  describe "score too high" do
    before { @review.score = 6 }
    it { should_not be_valid }
  end

  describe "date not present" do
    before { @review.date = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to wine_id" do
      expect do
        Review.new(wine_id: wine.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "review belongs to a wine" do
    before { @review = wine.reviews.build(score: 4, date: DateTime.now) }
    subject { @review }
    it { should be_valid }
    it { should respond_to(:wine_id)}
  end

  describe "review belongs to a user" do
    before { @review = wine.reviews.build(score: 4, date: DateTime.now) }
    subject { @review }
    it { should be_valid }
    it { should respond_to(:user_id)}
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Review.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end