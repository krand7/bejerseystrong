class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin!
  before_action :check_campus_captain!, only: [:new_volunteer, :create_volunteer]

  respond_to :html

  def index
    @users = User.all
  end

  def new
  end

  def new_volunteer
    @user = User.where(school: current_user.school).new
  end

  def create_volunteer
    @user = User.new(user_params)
    flash[:notice] = 'User was successfully created.' if @user.save
    respond_with(@user)
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :school)
    end

end
