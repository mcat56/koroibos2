class Api::V1::Olympians::TopMedalistsController < ApplicationController

  def index
    top_male = Olympian.top_male
    top_female = Olympian.top_female
    result = { top_medalists: {} }
    result[:top_medalists][:male] = TopMedalistSerializer.new(top_male)
    result[:top_medalists][:female] = TopMedalistSerializer.new(top_female)
    render status: :ok, json: result
  end
end
