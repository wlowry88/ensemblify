require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
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
      ),
      User.create!(
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
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Instrument".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Bio".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Instrument".to_s, :count => 2
    assert_select "tr>td", :text => "Level".to_s, :count => 2
    assert_select "tr>td", :text => "Video Sample".to_s, :count => 2
    assert_select "tr>td", :text => "Audio Sample".to_s, :count => 2
    assert_select "tr>td", :text => "Type Preferences".to_s, :count => 2
    assert_select "tr>td", :text => "Style Preferences".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
