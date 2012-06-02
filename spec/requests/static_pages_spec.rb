require 'spec_helper'

describe "StaticPages" do
  let(:base_title) {"WineNotes"}

  describe "home" do
    it "should have the content WineNotes" do
      visit '/static_pages/home'
      page.should have_content 'WineNotes'
    end

    it "should have a title of Home" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title} | Home" )
    end
  end

  describe "help" do
    it "should have the content Help" do
      visit '/static_pages/help'
      page.should have_content 'Help'
    end

    it "should have a title of Help" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help" )
    end
  end

  describe "about" do
    it "should have the content About" do
      visit '/static_pages/about'
      page.should have_content 'About'
    end

    it "should have a title of About" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | About" )
    end
  end

end
