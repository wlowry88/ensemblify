class StaticPagesController < ApplicationController
  skip_before_action :registered?

  def about
  end

end
