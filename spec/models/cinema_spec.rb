require 'rails_helper'

RSpec.describe Cinema do
  cinema1 = FactoryGirl.create(:cinema)
  cinema2 = FactoryGirl.create(:cinema)
  cinema1.cinema_name.should == "cinema 1"
  cinema2.cinema_name.should == "cinema 2"

end

