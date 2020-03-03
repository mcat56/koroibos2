class Api::V1::Events::MedalistsController < ApplicationController

  def index
    facade = EventMedalistsFacade.new(Event.find(params[:id])).event_medalists
    render status: :ok, json: facade
  end
end
