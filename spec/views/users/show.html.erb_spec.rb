require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :instrument => "Instrument",
      :gender => "Gender",
      :first_name => "First Name",
      :last_name => "Last Name",
      :short_bio => "Short Bio",
      :image => "Image",
      :email => "Email",
      :zipcode => 1,
      :phone_number => "Phone Number",
      :instrument => "Instrument",
      :level => "Level",
      :video_sample => "Video Sample",
      :audio_sample => "Audio Sample",
      :type_preferences => "Type Preferences",
      :style_preferences => "Style Preferences",
      :availability => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Instrument/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Short Bio/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Instrument/)
    expect(rendered).to match(/Level/)
    expect(rendered).to match(/Video Sample/)
    expect(rendered).to match(/Audio Sample/)
    expect(rendered).to match(/Type Preferences/)
    expect(rendered).to match(/Style Preferences/)
    expect(rendered).to match(/2/)
  end
end
