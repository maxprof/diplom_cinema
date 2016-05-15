require 'rails_helper'

RSpec.describe "session_times/index", type: :view do
  before(:each) do
    assign(:session_times, [
      SessionTime.create!(
        :time => "Time"
      ),
      SessionTime.create!(
        :time => "Time"
      )
    ])
  end

  it "renders a list of session_times" do
    render
    assert_select "tr>td", :text => "Time".to_s, :count => 2
  end
end
