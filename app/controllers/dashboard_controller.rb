class DashboardController < ApplicationController
  before_action :check_admin!, only: [:aggregate_report]
  before_action :authenticate_user!

  def show
    @conversations = current_user.conversations.current
  end

  def profile
  end

  def aggregate_report
  end

  def change_password
    if current_user.update_with_password(user_password_params)
      sign_in current_user, bypass: true
      redirect_to profile_path, notice: "Your password has been successfully changed."
    else
      render :profile
    end
  end

  private
  def user_password_params
    params.required(:user).permit(:password, :password_confirmation, :current_password)
  end

end
