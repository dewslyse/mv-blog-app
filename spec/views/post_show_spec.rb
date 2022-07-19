require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tomas', photo: 'https://usp.com/pto.png', bio: 'Web developer')
    @user2 = User.create(name: 'Anne', photo: 'https://usp.com/pto.png', bio: 'Recruiter')
    @post1 = Post.create(user: @user1, title: 'Dev in 2020', text: 'How to be a dev in 2020')
    @comment1 = Comment.create(user: @user1, post: @post1, text: 'This is comment 1')
    @comment2 = Comment.create(user: @user1, post: @post1, text: 'This is comment 2')
    Like.create(user: @user2, post: @post1)

    visit user_post_path(@user1, @user1.posts.first)
  end

  # it 'displays the post\'s title' do
  #   expect(page).to have_content('Dev in 2020')
  # end

  # it 'displays the author\'s username' do
  #   expect(page).to have_content(@user1.name)
  # end

  # it 'displays how many comments the post has' do
  #   expect(page).to have_content(@post1.comments_counter)
  # end

  # it 'displays how many likes the post has' do
  #   expect(page).to have_content(@post1.likes_counter)
  # end

  # it 'displays the post\'s body' do
  #   expect(page).to have_content('How to be a dev in 2020')
  # end

  # it 'displays the name of each commentor' do
  #   expect(page).to have_content(@comment1.user.name)
  # end

  # it 'displays comments from all commentors' do
  #   expect(page).to have_content('This is comment 1')
  #   expect(page).to have_content('This is comment 2')
  # end
end
