require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "home page" do
      it "should have content 'Sample App'" do
        visit "/static_pages/home"
        expect(page).to have_content('Sample App')
      end
  end

  describe 'help page' do
    it 'should have Sample App' do
      visit 'static_pages/help'
      expect(page).to have_content('Sample App')
    end
  end

  describe 'about page' do
    it 'should have About Us' do
      visit 'static_pages/about'
      expect(page).to have_content('Sample App')
    end
  end
end

