class DashboardController < ApplicationController

  before_action :authenticate_user!

  def show
    @conversations = current_user.conversations.current
  end

end