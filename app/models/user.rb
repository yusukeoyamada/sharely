class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable,
       :omniauthable, omniauth_providers: %i(google facebook github)

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.new(name: auth.info.name,
                      email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20]
                      # icon_image: auth.info.image
      )
    end
    user.save
    user
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(provider: auth.provider,
                      uid:      auth.uid,
                      name:     auth.info.name,
                      email:    User.dummy_email(auth),
                      password: Devise.friendly_token[0, 20]
                      # icon_image: auth.info.image
      )
    end
    user.save
    user
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(provider: auth.provider,
                      uid:      auth.uid,
                      name:     auth.info.name,
                      email:    User.dummy_email(auth),
                      password: Devise.friendly_token[0, 20]
                      # icon_image: auth.info.image
      )
    end
    user.save
    user
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  # ユーザーの貢献度の計算の為のメソッド
  def calculate_point
    number_of_questions = Question.where(user_id: self.id).count
    number_of_answers = Answer.where(user_id: self.id).count
    number_of_reports = Report.where(user_id: self.id).count
    user_points = number_of_reports * 30 + number_of_answers * 30 + number_of_questions * 10
  end

  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :questions, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :fav_ques, dependent: :destroy
  has_many :fav_rpts, dependent: :destroy

  mount_uploader :icon_image, UserImageUploader
end
