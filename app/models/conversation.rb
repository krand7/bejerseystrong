class Conversation < ActiveRecord::Base

  STATUS = [['Pending', 'pending'], ['Contacted', 'contacted'], ['Enrolled', 'enrolled'], ['Passed', 'passed'], ['Denied', 'denied']]

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
