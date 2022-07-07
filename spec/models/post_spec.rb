require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/', bio: 'Teacher')

  subject { Post.new(user:, title: 'Hello', text: 'First post') }

  before { subject.save }

  it 'triggers an update on posts_counter' do
    count = user.posts_counter
    subject.save
    expect(user.posts_counter).to eq(count + 1)
  end

  it 'recent_comments method returns last 5 comments' do
    7.times { Comment.create(user:, post: subject, text: 'Multiple comments') }
    expect(subject.recent_comments.size).to eq(5)
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be longer than 250 char' do
    subject.title = 'a' * 252
    expect(subject).to_not be_valid
  end

  it 'should have an integer on comments_counter' do
    subject.comments_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'should have comments_counter number greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have an integer on likes_counter' do
    subject.likes_counter = 4.5
    expect(subject).to_not be_valid
  end

  it 'should have likes_counter number greater than or equal to zero' do
    subject.likes_counter = 5
    expect(subject).to be_valid
  end
end
