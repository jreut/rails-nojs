class Conversation < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  def participants
    # OPTIMIZE: calculate uniqueness in the database
    users.uniq.map(&:name)
  end
end
