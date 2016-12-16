class EventsController < ApplicationController
  def index
  	@state = State.all
  	@user = User.find(session[:user_id])
  	@instate = Event.in_state(session[:user_state])
  	@outofstate = Event.out_of_state(session[:user_state])
  end

  def create
  	event = Event.new(event_params)
  	if event.save
  	  JoinedEvent.new(user: User.find(session[:user_id]), event: Event.find(params[:id]))
  	  redirect_to :back
  	else
  	  flash[:errors] = event.errors.full_messages
      redirect_to :back
     end
  end

  def show
  	@event = Event.host_and_state(params[:event_id])
  end

  def edit
  	#if not owner then kick. Put this here or at top of view?
  	@event = Event.find(params[:id])
  	@state = State.all
  end

  def update
  	event = Event.find(params[:id])
  	event.update(event_params)
  	if event.save
  	  redirect_to "/events/#{params[:id]}"
  	else
  	  flash[:errors] = event.errors.full_messages
	  redirect_to :back
	end
  end

  def destroy
  	Event.find(params[:id]).delete
  	redirect_to :back
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :location, :state_id, :user_id)
  end
end
