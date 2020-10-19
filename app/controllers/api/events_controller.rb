class Api::EventsController < ApplicationController
  def index
    @events = Event.all
    render "index.json.jb"
  end
  def show
    @event = Event.find(params[:id])
    render "show.json.jb"
  end
end
