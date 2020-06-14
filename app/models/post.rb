class Post < ApplicationRecord
  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }

  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many_attached :photos
end
