class Entry < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, prosence: true,length: {200}
end
