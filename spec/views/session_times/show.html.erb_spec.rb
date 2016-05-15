require 'rails_helper'

RSpec.describe "session_times/show", type: :view do
  before(:each) do
    @session_time = assign(:session_time, SessionTime.create!(
      :time => "Time"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Time/)
  end
end
