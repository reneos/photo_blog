class Post < ApplicationRecord
  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }

  before_create do
    self.post_date = created_at
  end

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :category, optional: true

  has_many_attached :photos
end
