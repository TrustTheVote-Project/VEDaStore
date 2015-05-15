class Vssc::ContestsController < ApplicationController
  def show
    @contest = Vssc::Contest.find(params[:id])
  end
end
