require 'spec_helper'

describe "StaticPages" do
  let(:base_title) {"WineNotes"}

  before { visit root_path }
  describe "home" do
    it "should have the content WineNotes" do
      page.should have_content 'WineNotes'
    end

    it "should have a title of Home" do
      page.should have_selector('title', :text => "#{base_title}" )
    end
  end

  describe "help" do
    before { visit help_path }
    it "should have the content Help" do
      page.should have_content 'Help'
    end

    it "should have a title of Help" do
      page.should have_selector('title', :text => "#{base_title} | Help" )
    end
  end

  describe "about" do
    before { visit about_path }

    it "should have the content About" do
      page.should have_content 'About'
    end

    it "should have a title of About" do
      page.should have_selector('title', :text => "#{base_title} | About" )
    end
  end

end
