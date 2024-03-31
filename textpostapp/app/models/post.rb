class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :media
  validates :content, presence:true
end
