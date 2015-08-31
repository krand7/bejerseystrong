class Conversation < ActiveRecord::Base

  STATUS = [['Registered', 'registered'], ['Contacted', 'contacted'], ['Pending', 'pending']]

  # Concerns
  include Deletable

  # Model relationships
  belongs_to :user

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
