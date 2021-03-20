class ApproveBrokerMailer < Devise::Mailer
  default to: -> { Admin.pluck(:email) },
    from: "noreply@example.com"

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: @email, subject: 'New User Awaiting Admin Approval')
  end
end
