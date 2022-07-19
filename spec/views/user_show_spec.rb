require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tomas', photo: 'https://usp.com/pto.png', bio: 'Web developer')
    @post1 = Post.create(user: @user1, title: 'Dev in 2020', text: 'How to be a dev in 2020')
    @post2 = Post.create(user: @user1, title: 'Dev in 2021', text: 'How to be a dev in 2021')
    @post3 = Post.create(user: @user1, title: 'Dev in 2022', text: 'How to be a dev in 2022')
    visit user_path(@user1)
  end

  it 'displays user\'s profile picture' do
    expect(page).to have_css('img')
  end

  it 'displays the user\'s username' do
    expect(page).to have_content(@user1.name)
  end

  it 'displays the number of posts each user has written' do
    expect(page).to have_content(@user1.posts_counter)
  end

  it 'displays the user\'s bio' do
    expect(page).to have_content(@user1.bio)
  end

  it 'displays the user\'s first 3 posts' do
    expect(page).to have_content('Dev in 2020')
    expect(page).to have_content('Dev in 2021')
    expect(page).to have_content('Dev in 2022')
  end

  it 'displays a button that lets me view all of a user\'s posts' do
    expect(page).to have_link('See all posts')
  end

  it 'redirects to post\'s show page when post is clicked' do
    click_on 'Dev in 2020'
    expect(page).to have_current_path user_post_path(@user1, @user1.posts.first)
  end

  it 'redirects to user\'s post\'s index page when see all posts is clicked' do
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@user1)
  end
end
