require 'rails_helper'

feature 'friendship request' do
  before(:each) do
    create_new_user_and_login
    click_on 'Sign out'
    create_second_user_and_login
  end

  scenario 'send friendship request' do
    visit('/users')
    click_button('Invite to friendship')
    expect(page).to have_content('Friend request sent successfully')
  end
end

feature 'respond to friendship request' do
  before(:each) do
    create_new_user_and_login
    click_on 'Sign out'
    create_second_user_and_login
    visit('/users')
    click_button('Invite to friendship')
    click_on 'Sign out'
    fill_in 'Email', with: 'ramesh@test.com'
    fill_in 'Password', with: 'ramesh'
    click_button 'Log in'
    visit('/users')
  end

  scenario 'accept friendship request' do
    click_button('Accept Friend request')
    expect(page).to have_content('Friend request accepted')
  end

  scenario 'reject friendship request' do
    click_button('Reject Friend request')
    expect(page).to have_content('Friend request rejected')
  end
end
