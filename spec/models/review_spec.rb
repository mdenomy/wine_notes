require 'spec_helper'

describe Review do

  before do
    @review = Review.new(score: 3)
  end

  subject { @review }

  it { should respond_to(:date) }
  it { should respond_to(:notes) }
  it { should respond_to(:score) }

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

end