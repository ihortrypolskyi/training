require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  let(:add_text) {'My training site - '}
  subject {page}
  # describe "home page" do
  #   before {visit home_path}
  #     it { should have_content('Sample App') }
  #     it { should have_title(full_title('')) }
  #     it { should_not have_title('Home') }
  # end
  describe 'about page' do
    it 'should have About Us' do
      visit about_path
      expect(page).to have_content('Sample App')
    end
  end

  describe 'help page' do
    subject {page}
    before {visit help_path}
    it {should have_content('Sample App')}
  end


  describe 'contact page' do
    before {visit contact_path}
    it 'should have content Contact' do
      expect(page).to have_selector('h1', text: 'Contact')
    end

    it 'should have title Contact' do
      expect(page).to have_title("#{add_text} Contact")
    end
  end


  shared_examples_for 'all static pages' do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title))}
  end

  describe 'Home page' do
    before {visit home_path}
    let(:heading) {'Sample App'}
    let(:page_title) {''}

    it_should_behave_like 'all static pages'
    it { should_not have_title('Home') }
  end

  it "should have the right links on the layout" do
    pending
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    expect(page).not_to have_title(full_title('Home'))
    click_link "Sign up"
    expect(page).to have_title(full_title('Sign up'))
  end

end

