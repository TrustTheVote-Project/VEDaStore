class Vssc::ElectionsController < ApplicationController
  def show
    @election = Vssc::Election.find(params[:id])
  end
end
