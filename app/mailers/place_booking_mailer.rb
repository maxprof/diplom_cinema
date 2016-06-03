class PlaceBookingMailer < ApplicationMailer
  default from: "maxprofcinema@gmail.com"

  def booking_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
