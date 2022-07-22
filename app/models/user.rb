class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  def admin?
    role == 'admin'
  end

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
