require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:add_text) {'My training site - '}
  subject {page}
  describe "home page" do
    before {visit home_path}
      it { should have_content('Sample App') }
      it { should have_title(full_title('')) }
      it { should_not have_title('Home') }
  end

  describe 'help page' do
    it 'should have Sample App' do
      visit help_path
      expect(page).to have_content('Sample App')
    end
  end

  describe 'about page' do
    it 'should have About Us' do
      visit about_path
      expect(page).to have_content('Sample App')
    end
  end

  describe 'contact page' do
    before {visit contact_path}
    it 'should have content Contact' do

      expect(page).to have_content('Sample App')
    end

    it "should have title Contact " do

      expect(page).to have_title("#{add_text} Contact")
    end
  end
end

