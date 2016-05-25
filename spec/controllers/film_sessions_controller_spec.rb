require 'spec_helper'

RSpec.describe FilmSessionsController do
  describe "show action" do
    it "renders show template if an session is found" do
      film_session = create(:film_session)
      get :show, {id: film_session.id}
    end
  end
end
