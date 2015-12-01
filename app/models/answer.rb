class Answer < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  belongs_to :question

  # Validations
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :value, presence: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
end
