class Api::V1::OlympianStatsController < ApplicationController

  def index
    olympians = Olympian.all
    stats = OlympianStatSerializer.new(olympians)
    render status: :ok, json: stats
  end
end
