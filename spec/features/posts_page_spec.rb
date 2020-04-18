require 'rails_helper'

feature 'Posts page' do
  before(:each) do
    create_new_user_and_login
  end

  scenario 'create new post' do
    @content = Faker::Lorem.sentence
    fill_in 'Content', with: @content
    click_button 'Save'
    expect(page).to have_content(@content)
  end

  scenario 'create new comment for the post' do
    @content = Faker::Lorem.sentence
    fill_in 'Content', with: @content
    click_button 'Save'
    @comment = Faker::Lorem.sentence
    page.find('#comment_content').set(@comment)
    page.find('#new_comment').find('[value="Comment"]').click
    expect(page).to have_content(@comment)
  end

  scenario 'sign out nav for log out' do
    click_on 'Sign out'
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'All users nav for User index page' do
    click_on 'All users'
    expect(current_path).to eq('/users')
  end
end
