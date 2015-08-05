class ContactMailer < ApplicationMailer
  default from: 'support@bejerseystrong.org'

  def contact_email(sender, subject, body)
    @sender = sender
    @subject = subject
    @body = body
    mail(to: 'kyle@bejerseystrong.org', subject: @subject)
  end

end
