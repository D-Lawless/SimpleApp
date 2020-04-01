class RegistrationsController < Devise::RegistrationsController

  private

  def after_sign_up_path_for(resource)
    new_profile_path(current_user.id)
  end

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def acount_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

end