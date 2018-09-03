class Report < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  #validates :permission_flag, presence: true

  belongs_to :user

  mount_uploader :image, ReportImageUploader
end
