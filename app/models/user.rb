class User < ApplicationRecord
  has_secure_password
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user
  validates :email, presence: true, uniqueness: true

  def self.have_friend(user_id)
    inverse_friends.each do |user|
      return true if user.id === user_id
    end
    return false
  end
end
