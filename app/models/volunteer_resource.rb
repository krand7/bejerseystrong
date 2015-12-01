class VolunteerResource < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  # Validations
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true

  # Callback
  # Other macros
  mount_uploader :file, FileUploader

  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
