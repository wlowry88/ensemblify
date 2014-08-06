class SearchController < ApplicationController

  def get_instruments_for_group
    instrument = params[:instrument]
    instrumentation_array = Instrumentation.all.collect{|i| i if i.instruments.include?(Instrument.find_by(name: instrument))}.compact
    render json: instrumentation_array.collect {|i| i.name }
  end

end