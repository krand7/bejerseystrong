class StaticController < ApplicationController
  def home
  end

  def team
  end

  def donate
  end

  def contact
  end

  def contact_submit
    ContactMailer.contact_email(params[:sender], params[:subject], params[:body]).deliver_now
    redirect_to contact_path, notice: 'Thank you - your message was sent!'
  end
end
