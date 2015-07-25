class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin!

  def index
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
