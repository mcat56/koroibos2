class Api::V1::Events::MedalistsController < ApplicationController

  def index
    event = Event.find(params[:id])
    medalists = event.get_medalists
    result = { event: event.name,
      medalists: [] }
    medalists.each {|medalist| result[:medalists] << MedalistSerializer.new(event, medalist)}
    result[:medalists]
    render status: :ok, json: result
  end
end
