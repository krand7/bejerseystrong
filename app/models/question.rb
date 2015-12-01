class Question < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  has_many :answers

  # Validations
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :display_type, presence: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
