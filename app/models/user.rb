class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :frequests
  has_many :inverse_frequests, class_name: 'Frequest', foreign_key: 'friend_id'

  def friends_list
    friends_array = frequests.map { |f| f.friend if f.status }
    friends_array + inverse_frequests.map { |f| f.user if f.status }
  end

  def pending_confirmations
    frequests.map { |f| f.friend unless f.status }.compact
  end

  def pending_requests
    inverse_frequests.map { |f| f.user unless f.status }.compact
  end

  def friend?(user)
    friends_list.include?(user)
  end

  def friend_request_sent?(user)
    pending_confirmations.include?(user)
  end

  def pending_request?(user)
    pending_requests.include?(user)
  end
end
