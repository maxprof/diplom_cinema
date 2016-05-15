require 'rails_helper'

RSpec.describe "session_times/edit", type: :view do
  before(:each) do
    @session_time = assign(:session_time, SessionTime.create!(
      :time => "MyString"
    ))
  end

  it "renders the edit session_time form" do
    render

    assert_select "form[action=?][method=?]", session_time_path(@session_time), "post" do

      assert_select "input#session_time_time[name=?]", "session_time[time]"
    end
  end
end
