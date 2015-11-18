class Appointment < ActiveRecord::Base
  # Default Scope
  # Constants
  # Attribute related macros
  # Associations
  belongs_to :user
  has_many :conversations

  # Validations
  validates :user_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
  validates :address_line_one, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :location, presence: true

  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  scope :incomplete, -> { current.where("conversation_count IS NULL or contact_card_count IS NULL or referral_count IS NULL or followup_call_count IS NULL") }

  # Methods
  def title
    location + ' with ' + user.first_name
  end

  def formatted_date
    date.strftime("%b %d, %Y")
  end

  def formatted_time
    start_time.strftime("%l:%M%P") + ' - ' + end_time.strftime("%l:%M%P")
  end

  def formatted_address
    street_address + '<br />' + city + ' NJ, ' + zipcode
  end

  def street_address
    address_line_two.present? ? address_line_one + '<br />' + address_line_two : address_line_one
  end

  def complete?
    conversation_count.present? && contact_card_count.present? && referral_count.present? && followup_call_count.present?
  end
end
