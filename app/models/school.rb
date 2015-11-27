class School < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  has_many :users

  # Validations
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
