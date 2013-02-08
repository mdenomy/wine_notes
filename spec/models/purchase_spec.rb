require 'spec_helper'

describe Purchase do

  describe 'attributes' do
    before do
      @purchase = Purchase.new
    end

    subject { @purchase }

    it { should respond_to :date }
    it { should respond_to :price }
    it { should respond_to :store }
  end

  describe 'validations' do
    it "must have a date" do
      Factory.build(:purchase, date: nil).should_not be_valid
    end
    it "must have a price greater than 0" do
      Factory.build(:purchase, price: 0).should_not be_valid
      Factory.build(:purchase, price: 0.01).should be_valid
    end
    it "must have a store" do
       Factory.build(:purchase, store: "").should_not be_valid
     end
   end
end
