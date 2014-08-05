class StaticPagesController < ApplicationController
  skip_before_action :registered?
end
