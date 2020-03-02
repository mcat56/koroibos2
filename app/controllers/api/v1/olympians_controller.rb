class Api::V1::OlympiansController < ApplicationController

  def index
    olympians = Olympian.all
    result = { olympians: [] }
    olympians.each { |olympian| result[:olympians] << OlympianSerializer.new(olympian) }
    render json: result
  end

end
