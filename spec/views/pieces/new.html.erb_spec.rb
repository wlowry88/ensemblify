require 'rails_helper'

RSpec.describe "pieces/new", :type => :view do
  before(:each) do
    assign(:piece, Piece.new(
      :name => "MyString",
      :composer => "MyString",
      :references => "",
      :level => 1
    ))
  end

  it "renders new piece form" do
    render

    assert_select "form[action=?][method=?]", pieces_path, "post" do

      assert_select "input#piece_name[name=?]", "piece[name]"

      assert_select "input#piece_composer[name=?]", "piece[composer]"

      assert_select "input#piece_references[name=?]", "piece[references]"

      assert_select "input#piece_level[name=?]", "piece[level]"
    end
  end
end
