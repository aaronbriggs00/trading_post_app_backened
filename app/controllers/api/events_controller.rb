class Api::EventsController < ApplicationController
  def index
    @events = Event.all
    if params[:current] == "yes"
      today = Time.now.to_datetime
      @events = Event.all.where("date >= ?", Time.now.to_datetime).order("date ASC")
    end
    # if params[:search_name]
    #   @events = @events.name_search(params[:search_name])
    # end
    # if params[:search_city]
    #   @events = @events.city_search(params[:search_city])
    # end
    # if params[:search_state]
    #   @events = @events.state_search(params[:search_state])
    # end
    render "index.json.jb"
  end
  def show
    @event = Event.find(params[:id])
    render "show.json.jb"
  end
  def seed
    zip = params[:zip]
    MarketGeneratorJob.perform_later(zip)
    render json: "working on #{zip}"
  end
end
