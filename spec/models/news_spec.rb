require 'rails_helper'

RSpec.describe News do
  news1 = FactoryGirl.create(:news)
  news2 = FactoryGirl.create(:news)
  news1.title.should == "1 test news title"
  news2.title.should == "2 test news title"

end

