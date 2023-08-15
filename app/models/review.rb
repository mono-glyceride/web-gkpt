class Review < ApplicationRecord
    belongs_to :user
    validates :topic, allow_nil: true, length: { maximum: 255 }
  end
