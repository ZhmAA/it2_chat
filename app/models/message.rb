class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :field, presence: true, length: {minimum: 2, maximum: 500}

  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def create_date
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
