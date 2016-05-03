require 'rails_helper'

RSpec.describe FilmSession do
  fs1 = FactoryGirl.create(:film_session)
  fs2 = FactoryGirl.create(:film_session)

  result = fs1.cinema_id + fs2.cinema_id
  result.should == 2
end

