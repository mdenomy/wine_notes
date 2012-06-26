require 'spec_helper'

describe Wine do

  before do
    @wine = Wine.new(producer: "Over The Top", brand_name: "Fred")
  end

  subject { @wine }

  it { should respond_to(:reviews)}

  describe "requires a producer" do
    before { @wine.producer = " " }
    it { should_not be_valid }
  end

  describe "requires a brand_name" do
    before { @wine.brand_name = " " }
    it { should_not be_valid }
  end
end
