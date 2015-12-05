class Conversation < ActiveRecord::Base
  # Default Scope
  # Constants
  STATUS = [["Must Contact Consumer for Follow Up", "followup_needed"],
            ["Referred Consumer to NJ Family Care", "referred_njfc"],
            ["Referred Consumer to SHIP Counselor", "referred_ship"],
            ["Referred Consumer to CAC Assister Organization", "referred_cac_org"],
            ["Referred Consumer to Navigator Organization", "referred_navigator_org"],
            ["Confirmed Consumer's Insurance Needs Are Met", "confirmed_needs_met"],
            ["Do Not Contact Consumer Again", "do_not_contact"]]

  COVERAGE = [["I do not currently have coverage", "none"],
              ["I need to renew coverage", "renew"],
              ["I am looking for better coverage", "better"],
              ["I know someone who needs coverage", "referral"]]

  # Attribute related macros
  # Associations
  belongs_to :user
  belongs_to :appointment

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :state, presence: true


  # Callback
  # Other macros
  # Concerns
  include Deletable

  # Named scopes
  # Methods
  def name
    if self.first_name.present? and self.last_name.present?
      return "#{self.first_name} #{self.last_name}"
    else
      if self.first_name.present?
        return self.first_name
      elsif self.last_name.present?
        return self.last_name
      else
        return ''
      end
    end
  end

  def complete?
    return false
  end

end
