class PaymentsController < ApplicationController
  protect_from_forgery :except => :liqpay_payment

  def liqpay_payment
    @liqpay_response = Liqpay::Response.new(params)
    @place = Place.find(@liqpay_response.order_id)

    @place.data = {}

    (Liqpay::Response::ATTRIBUTES - %w(public_key sender_phone transaction_id)).each do |attribute|
      @place.data[attribute] = @liqpay_response.send(attribute)
    end

    if @liqpay_response.success?
      @place.update_attributes!(:status => true)
    else
      @place.update_attributes!(:status => false)
    end
    redirect_to @place
  rescue Liqpay::InvalidResponse
    render text: 'Payment error', status: 500
  end
end
