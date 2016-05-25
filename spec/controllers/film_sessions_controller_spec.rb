require 'spec_helper'

RSpec.describe FilmSessionsController do
  describe "show action" do
    it "redirect to calendar because params with time and date not given" do
      film_session = create(:film_session)
      get :show, {id: film_session.id}
      response.should redirect_to('/calendar')
    end

    it "redirect to not_found because film session id = 0" do
      film_session = create(:film_session)
      get :show, {id: 0}
      response.should redirect_to('/errors/not_found')
    end
  end
end
