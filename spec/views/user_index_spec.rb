require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tomas', photo: 'https://usp.com/pto.png', bio: 'Web developer')
    visit root_path
  end

  it 'displays username of all other users' do
    expect(page).to have_content(@user1.name)
  end

  it 'displays profile picture for each user' do
    expect(page).to have_css('img')
  end

  it 'the number of posts each user has written' do
    expect(page).to have_content('Number of posts')
  end

  it 'redirects to user show page when user is clicked' do
    click_on 'Tomas'
    expect(page).to have_current_path user_path(@user1)
  end
end
