class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  # def contact_mail
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

  def contact_mail(contact)
    @contact = contact
    mail to: "westyle@contact.com", subject: "WestleContact"
  end
end
