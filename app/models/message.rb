class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :field, presence: true, length: {minimum: 2, maximum: 500}

  def create_date
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
