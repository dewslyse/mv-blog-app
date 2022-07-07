require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/', bio: 'Teacher') }

  before { subject.save }

  it 'recent_posts method returns last 3 posts' do
    5.times { Post.create(user: subject, title: 'Mulitple hellos', text: 'Multiple first posts') }
    expect(subject.recent_posts.size).to eq(3)
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an integer on posts_counter' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'should have posts_counter number greater than or equal to zero' do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end
end
