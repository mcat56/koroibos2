class Api::V1::OlympianStatsController < ApplicationController

  def index
    stats = OlympianStatSerializer.new(Olympian.all)
    render status: :ok, json: stats
  end
end
