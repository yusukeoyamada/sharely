class Question < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :fav_ques, dependent: :destroy

  mount_uploader :image, QuestionImageUploader
end
