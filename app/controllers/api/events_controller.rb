class Api::EventsController < ApplicationController
  def index
    # MarketGeneratorJob.perform_later()
    today = 
    @events = Event.all
    if params[:search_name]
      @events = @events.name_search(params[:search_name])
    end
    if params[:search_city]
      @events = @events.city_search(params[:search_city])
    end
    if params[:search_state]
      @events = @events.state_search(params[:search_state])
    end
    render "index.json.jb"
  end
  def show
    @event = Event.find(params[:id])
    render "show.json.jb"
  end
end
