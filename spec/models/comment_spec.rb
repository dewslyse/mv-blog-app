require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/', bio: 'Teacher')
  post = Post.create(user:, title: 'Hello', text: 'First post')

  subject { Comment.new(post:, user:, text: 'Hi Tom!') }

  before { subject.save }

  it 'triggers an update on comments_counter' do
    count = post.comments_counter
    subject.save
    expect(post.comments_counter).to eq(count + 1)
  end
end
