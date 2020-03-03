class Api::V1::Olympians::TopMedalistsController < ApplicationController

  def index
    facade = TopMedalistsFacade.new.top_medalists
    render status: :ok, json: facade
  end
end
