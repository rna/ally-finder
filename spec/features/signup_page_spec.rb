require 'rails_helper'

feature 'signup_page' do
  scenario 'new user signup and redirect to posts page' do
    visit('/')
    click_link 'Sign up'
    expect(page).to have_button('Sign up')
    fill_in 'Name', with: 'Ramesh'
    fill_in 'Email', with: 'ramesh@test.com'
    fill_in 'Password', with: 'ramesh'
    fill_in 'Password confirmation', with: 'ramesh'
    click_button 'Sign up'
    expect(page).to have_content('Recent posts')
  end
end
