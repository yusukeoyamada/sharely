class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end
