require 'rails_helper'

RSpec.describe "groups/new", :type => :view do
  before(:each) do
    assign(:group, Group.new(
      :name => "MyString",
      :type => nil,
      :complete => false,
      :admin => 1
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input#group_name[name=?]", "group[name]"

      assert_select "input#group_type_id[name=?]", "group[type_id]"

      assert_select "input#group_complete[name=?]", "group[complete]"

      assert_select "input#group_admin[name=?]", "group[admin]"
    end
  end
end
