class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_campus_captain!, only: [:new_volunteer, :create_volunteer, :my_volunteers]
  before_action :check_admin!, only: [:new, :show, :destroy]
  before_action :set_user, only: [:show, :destroy]
  respond_to :html

  def index
    redirect_to my_volunteers_users_path and return unless current_user.admin?
    @users = User.all
  end

  def new
  end

  def new_volunteer
    @user = User.where(school: current_user.school).new
  end

  def create_volunteer
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to my_volunteers_users_path, notice: 'Your volunteer will receive an email shortly.' }
      else
        format.html { render :new_volunteer }
      end
    end
  end

  def my_volunteers
    @volunteers = User.where(school: current_user.school)
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to profile_path, notice: 'Profile successfully saved!' }
      else
        format.html { render profile_path }
      end
    end
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                  :school, :phone, :race, :familiar_communities, :language_one, :language_two, :language_three)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
