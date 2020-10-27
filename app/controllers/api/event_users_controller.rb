class Api::EventUsersController < ApplicationController

  before_action :authenticate_user

  def create
    @event_user = EventUser.new(
      user_id: current_user.id,
      event_id: params[:event_id]
    )
    if @event_user.save #happy
      render "show.json.jb"
    else #sad
      render json: { errors: @event_user.errors.full_messages }, status: :bad_request
    end
  end
  def destroy
    event_user = EventUser.where(event_id: params[:id]).where(user_id: current_user.id)
    event_user[0].destroy
    render json: { message: "event_user destroyed" }
  end
end
