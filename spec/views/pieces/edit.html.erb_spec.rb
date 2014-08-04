require 'rails_helper'

RSpec.describe "pieces/edit", :type => :view do
  before(:each) do
    @piece = assign(:piece, Piece.create!(
      :name => "MyString",
      :composer => "MyString",
      :references => "",
      :level => 1
    ))
  end

  it "renders the edit piece form" do
    render

    assert_select "form[action=?][method=?]", piece_path(@piece), "post" do

      assert_select "input#piece_name[name=?]", "piece[name]"

      assert_select "input#piece_composer[name=?]", "piece[composer]"

      assert_select "input#piece_references[name=?]", "piece[references]"

      assert_select "input#piece_level[name=?]", "piece[level]"
    end
  end
end
