class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :topic, presence: true, uniqueness: true, case_sensitive: false

  before_create :generate_slug

  def generate_slug
    self[:slug] = topic.parameterize
  end
end
