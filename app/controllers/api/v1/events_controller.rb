class Api::V1::EventsController < ApplicationController

  def index
    facade = EventsFacade.new.events
    render status: :ok, json: facade
  end

end
