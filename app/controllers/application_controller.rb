class ApplicationController < ActionController::Base
  helper_method :find_session_name_for_user_place
  helper_method :check_booking_time

  def find_session_name_for_user_place(place)
    session_name = FilmSession.find(id = place.film_session_id).session_name
  end

  def check_booking_time
    @places = Place.all
    @places.each do |place_booked_time|
      if place_booked_time.status == false
        @test_time = Time.now.to_s.to_time - place_booked_time.created_at.to_s.to_time
        if @test_time.to_i > 3.hours.to_i
          place_booked_time.destroy
        end
      end
    end
  end

  protect_from_forgery with: :exception
end
