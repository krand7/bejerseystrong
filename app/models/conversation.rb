class Conversation < ActiveRecord::Base

  STATUS = [["Must Contact Consumer for Follow Up", "followup_needed"],
            ["Referred Consumer to NJ Family Care", "referred_njfc"],
            ["Referred Consumer to SHIP Counselor", "referred_ship"],
            ["Referred Consumer to CAC Assister Organization", "referred_cac_org"],
            ["Referred Consumer to Navigator Organization", "referred_navigator_org"],
            ["Confirmed Consumer's Insurance Needs Are Met", "confirmed_needs_met"],
            ["Do Not Contact Consumer Again", "do_not_contact"]]

  # Concerns
  include Deletable

  # Model relationships
  belongs_to :user
  belongs_to :appointment

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

end
