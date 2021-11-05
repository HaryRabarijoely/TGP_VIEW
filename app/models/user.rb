class User < ApplicationRecord
  belongs_to :city
  has_many :likes, dependent: :destroy
  has_many :gossips
  has_many :comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "RecipientList"
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "please enter a valid email" }
  validates :age, :numericality => { :greater_than_or_equal_to => 0 }
end
