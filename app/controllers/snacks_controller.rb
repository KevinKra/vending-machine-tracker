class SnacksController < ApplicationController
  def show
    @snack = Snack.find_by(id: params[:id])
  end
end