class Post < ApplicationRecord
  belongs_to :user, counter_cache: :posts_counter
  has_many :comments
  has_many :likes
end
