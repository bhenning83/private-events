class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to user_path(current_user.id)
  end


  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :description)
  end
end
