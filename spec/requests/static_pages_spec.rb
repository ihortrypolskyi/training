require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:add_text) {'my site page: '}
  describe "home page" do
      it "should have content 'Sample App'" do
        visit "/static_pages/home"
        expect(page).to have_content('Sample App')
      end
      it 'should have title Home' do
        visit 'static_pages/home'
        expect(page).to have_title("#{add_text} Home")
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

  describe 'contact page' do
    it 'should have content Contact' do
      visit 'static_pages/contact'
      expect(page).to have_content('Sample App')
    end

    it "should have title Contact " do
      visit 'static_pages/contact'
      expect(page).to have_title("#{add_text} Contact")
    end
  end
end

