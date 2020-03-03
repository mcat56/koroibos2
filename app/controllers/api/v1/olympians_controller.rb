class Api::V1::OlympiansController < ApplicationController

  def index
    facade = OlympiansFacade.new(params[:age]).olympians
    render status: :ok, json: facade
  end
end
