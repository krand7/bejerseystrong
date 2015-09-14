class Volunteer < ActiveRecord::Base

  # Concerns
  include Deletable

  # Model validation
  validates_presence_of :first_name, :last_name, :email, :zip_code

end
