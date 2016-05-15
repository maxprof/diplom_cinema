require 'rails_helper'

RSpec.describe "session_times/new", type: :view do
  before(:each) do
    assign(:session_time, SessionTime.new(
      :time => "MyString"
    ))
  end

  it "renders new session_time form" do
    render

    assert_select "form[action=?][method=?]", session_times_path, "post" do

      assert_select "input#session_time_time[name=?]", "session_time[time]"
    end
  end
end
