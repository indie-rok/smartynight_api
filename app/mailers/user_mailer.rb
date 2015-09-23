class UserMailer < ApplicationMailer
  default from: 'miguel@smartynight.co'
  default :template_path => 'user_mailer'

  def contact_email(contact)
    @contact = contact
    mail(to: "ind3.rok@gmail.com", subject: "New form submission on SmartyNight" )
    render json: {message: 'Sent!'},status: :created
  end
end
