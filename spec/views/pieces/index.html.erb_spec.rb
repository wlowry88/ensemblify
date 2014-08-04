require 'rails_helper'

RSpec.describe "pieces/index", :type => :view do
  before(:each) do
    assign(:pieces, [
      Piece.create!(
        :name => "Name",
        :composer => "Composer",
        :references => "",
        :level => 1
      ),
      Piece.create!(
        :name => "Name",
        :composer => "Composer",
        :references => "",
        :level => 1
      )
    ])
  end

  it "renders a list of pieces" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Composer".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
