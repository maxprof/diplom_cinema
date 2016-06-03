class PlacesController < ApplicationController
  before_action :delete_old_places, only: [:show]
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_action :check_booking_time, except: [:index]

  def index
    @places = Place.all
  end

  def show
    @cinema = Cinema.find(@place.cinema_id)
    @session = FilmSession.find(@place.film_session_id)
    @searched_film_session_price = FilmSession.find(@place.film_session_id).price.to_i
    @place_title = FilmSession.find(@place.film_session_id).session_name
    check_payment_status
  end

  def new
    @place = Place.new
    flash[:danger] = "This page does not exist"
    redirect_to root_path
  end

  def edit
    flash[:danger] = "This page does not exist"
    redirect_to root_path
  end

  def create
    @place = current_user.places.build(place_params)
    @place.status = false


    if @place.save
      flash[:success] = "New place was successufly created"
      redirect_to place_path(@place)
    else
      render 'new'
    end

  end

  def update
    if @place.update(place_params)
      flash[:success] = "Place was successufly updated"
      redirect_to place_path(@place)
    else
      render 'new'
    end
    flash[:danger] = "This page does not exist"
    redirect_to root_path
  end

  def destroy
    @place.destroy
    flash[:danger] = "Place was successufly deleted"
    redirect_to places_path
  end

  private

    def check_payment_status
      if @place.status == false
        @liqpay_request = Liqpay::Request.new(
          :amount => @searched_film_session_price,
          :currency => 'UAH',
          :description => "#{@place_title}, Place number: #{@place.place_number}, date: #{@place.session_date}, time: #{@place.session_time}",
          :order_id => @place.id,
          :sandbox => 1,
          :result_url => place_url(@place)
          # :server_url => liqpay_payment_place_url(@place)
        )
      end
    end

    def delete_old_places
      @film_sessions_places = FilmSession.all
      @film_sessions_places.each do |film_session_place|
        film_session_place.places.each do |place|
          if Date.today.to_s > place.session_date
            place.delete
            puts "------------"
            puts place.session_date
            puts "------------"
          end
        end
      end
    end

    def check_if_admin
      if !user_signed_in? || !current_user.admin?
        flash[:danger] = "You have't access rights for this operation"
        redirect_to root_path
      end
    end
    def set_place
      @place = Place.where(id: params[:id]).limit(1).first
      if !@place.present?
        redirect_to '/errors/not_found'
      end
    end

    def check_booking_time
      @places = Place.all
      @places.each do |place_booked_time|
        if place_booked_time.status == false
          @test_time = Time.zone.now.to_s.to_time - place_booked_time.created_at.to_s.to_time
          if @test_time.to_i > 3.hours.to_i
            place_booked_time.destroy
          end
        end
      end
    end

    def place_params
      params.require(:place).permit(:session_start_date, :cinema_id, :film_session_id, :place_number, :status, :user_id, :session_time, :session_date)
    end
end
