class Frequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_uniqueness_of :friend_id, scope: :user_id, message: 'Duplicate request'
end
