class Api::V1::EventsController < ApplicationController

  def index
    sports = Sport.all
    result = { events: [] }
    sports.each { |sport| result[:events] << SportSerializer.new(sport) }
    render status: :ok, json: result
  end

end
