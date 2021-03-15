class ApproveBrokerMailer < Devise::Mailer
  default to: -> { Admin.pluck(:email) },
    from: ENV["GMAIL_USERNAME"]

  def new_user_waiting_for_approval(email)
    @email = email
    mail(subject: 'New Broker Awaiting Admin Approval')
  end
end
