class Post < ApplicationRecord
  belongs_to :user, counter_cache: :posts_counter
  has_many :comments
  has_many :likes

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
