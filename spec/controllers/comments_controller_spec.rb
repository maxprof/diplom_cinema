require 'spec_helper'

include Devise::TestHelpers
RSpec.describe CommentsController do

  describe "create action" do

    sign_in FactoryGirl.create(:user)

    it "redirect to place_path if place is save" do
      post :create, comment: { body: "Comment test body", user_id: @user.id }
      response.should redirect_to place_path(assigns(:comment))
    end

    it "redirect to rot_path if validation fail" do
      post :create, comment: { body: "", user_id: @user.id }
      response.should redirect_to root_path
    end
  end
end
