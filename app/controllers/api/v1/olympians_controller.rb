class Api::V1::OlympiansController < ApplicationController

  def index
    if params[:age] == 'youngest'
      olympians = Olympian.order(:age).limit(1)
    elsif params[:age] == 'oldest'
      olympians = Olympian.order(age: :desc).limit(1)
    else
      olympians = Olympian.all
    end

    result = { olympians: [] }
    olympians.each { |olympian| result[:olympians] << OlympianSerializer.new(olympian) }
    render json: result
  end

end
