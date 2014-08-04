require 'rails_helper'

RSpec.describe "users/new", :type => :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :instrument => "MyString",
      :gender => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :short_bio => "MyString",
      :image => "MyString",
      :email => "MyString",
      :zipcode => 1,
      :phone_number => "MyString",
      :instrument => "MyString",
      :level => "MyString",
      :video_sample => "MyString",
      :audio_sample => "MyString",
      :type_preferences => "MyString",
      :style_preferences => "MyString",
      :availability => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_instrument[name=?]", "user[instrument]"

      assert_select "input#user_gender[name=?]", "user[gender]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_short_bio[name=?]", "user[short_bio]"

      assert_select "input#user_image[name=?]", "user[image]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_zipcode[name=?]", "user[zipcode]"

      assert_select "input#user_phone_number[name=?]", "user[phone_number]"

      assert_select "input#user_instrument[name=?]", "user[instrument]"

      assert_select "input#user_level[name=?]", "user[level]"

      assert_select "input#user_video_sample[name=?]", "user[video_sample]"

      assert_select "input#user_audio_sample[name=?]", "user[audio_sample]"

      assert_select "input#user_type_preferences[name=?]", "user[type_preferences]"

      assert_select "input#user_style_preferences[name=?]", "user[style_preferences]"

      assert_select "input#user_availability[name=?]", "user[availability]"
    end
  end
end
