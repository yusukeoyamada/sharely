class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :fav_ans, dependent: :destroy
end
