require 'rails_helper'

RSpec.describe "pieces/show", :type => :view do
  before(:each) do
    @piece = assign(:piece, Piece.create!(
      :name => "Name",
      :composer => "Composer",
      :references => "",
      :level => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Composer/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
  end
end
