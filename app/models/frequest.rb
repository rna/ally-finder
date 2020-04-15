class Frequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :friend_id, presence: true, uniqueness: { scope: :user_id, message: 'Duplicate request' }
  validates :user_id, presence: true
end
