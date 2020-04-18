require 'rails_helper'

feature 'home page' do
  before(:each) do
    visit root_path
  end

  scenario 'route to login page if not log in' do
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'redirect to posts page after login' do
    User.create!(name: 'ramesh', email: 'ramesh@test.com', password: 'ramesh', password_confirmation: 'ramesh')
    fill_in 'Email', with: 'ramesh@test.com'
    fill_in 'Password', with: 'ramesh'
    click_button 'Log in'
    expect(page).to have_content('Recent posts')
  end

  scenario 'have a signup link on homepage' do
    expect(page).to have_link('Sign up')
    click_on 'Sign up'
    expect(current_path).to eq('/users/sign_up')
  end
end
