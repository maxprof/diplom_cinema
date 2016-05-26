require 'spec_helper'

RSpec.describe CommentsController do
  describe "create action" do
    it "should create" do
      film_session = create(:film_session)
      get :show, {id: 0}
      response.should redirect_to('/errors/not_found')
    end
  end
end
