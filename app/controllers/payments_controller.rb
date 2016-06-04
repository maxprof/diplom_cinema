class PaymentsController < ApplicationController
  protect_from_forgery :except => :liqpay_payment

  def liqpay_payment
    @liqpay_response = Liqpay::Response.new(params)
    @place = Place.find(@liqpay_response.order_id)
    puts "-------------------------------------------------------------------------------------"
    puts "----------------------------------------"
    puts @place

    @place.data = {}

    (Liqpay::Response::ATTRIBUTES - %w(public_key sender_phone transaction_id)).each do |attribute|
      @place.data[attribute] = @liqpay_response.send(attribute)
    end

    check_response_status

    redirect_to @place
  rescue Liqpay::InvalidResponse
    render text: 'Payment error', status: 500
  end

  private

  def check_response_status
    if @liqpay_response.success? && @liqpay_reponse.amount == @Place.price
      @place.update_attributes!(:status => true)
      PlaceBookingMailer.booking_email(current_user).deliver
    else
      @place.update_attributes!(:status => false)
    end
  end
end
