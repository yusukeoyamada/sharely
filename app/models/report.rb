class Report < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :fav_rpts, dependent: :destroy

  mount_uploader :image, ReportImageUploader

  acts_as_ordered_taggable_on :relation_words
end
