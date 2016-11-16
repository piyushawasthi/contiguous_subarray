class DashboardsController < ApplicationController
  before_action :set_array, only: [:get_array]

  def index
  end

  def get_array
  	@largest = DashboardServices::ContiguousSubarrayGenerator.new(@input_array).process!
  	render action: :index
  end
 
  private

  def set_array
  	@input_array = params[:input_array].split(",").map(&:to_i)
  end
end
