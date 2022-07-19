require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tomas', photo: 'https://usp.com/pto.png', bio: 'Web developer')
    @user2 = User.create(name: 'Anne', photo: 'https://usp.com/pto.png', bio: 'Recruiter')
    @post1 = Post.create(user: @user1, title: 'Dev in 2020', text: 'How to be a dev in 2020')
    @comment1 = Comment.create(user: @user1, post: @post1, text: 'This is comment 1')
    @comment2 = Comment.create(user: @user1, post: @post1, text: 'This is comment 2')
    Like.create(user: @user2, post: @post1)

    visit user_posts_path(@user1)
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

  it 'displays a post\'s title' do
    expect(page).to have_content('Dev in 2020')
  end

  it 'displays some of the post\'s body' do
    expect(page).to have_content('How to be a dev in 2020')
  end

  it 'displays the first comments on a post' do
    expect(page).to have_content('This is comment 1')
    expect(page).to have_content('This is comment 2')
  end

  it 'displays  how many comments a post has' do
    expect(page).to have_content(@post1.comments_counter)
  end

  it 'displays the how many likes a post has' do
    expect(page).to have_content(@post1.likes_counter)
  end

  it 'redirects to post\'s show page when post is clicked' do
    click_on 'Dev in 2020'
    expect(page).to have_current_path user_post_path(@user1, @user1.posts.first)
  end
end
