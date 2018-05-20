class Comment < ApplicationRecord
  belongs_to :entry
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
end
