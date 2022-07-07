require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/', bio: 'Teacher')
  post = Post.create(user:, title: 'Hello', text: 'First post')

  subject { Like.new(post:, user:) }

  before { subject.save }

  it 'triggers an update on likes_counter' do
    count = post.likes_counter
    subject.save
    expect(post.likes_counter).to eq(count + 1)
  end
end
