class ContactMailer < ApplicationMailer
  def contact_mailer(contact)
    @contact = contact

    mail to: "fa19940118@gmail.com", subject: "お問い合わせの確認メール"
  end
end
