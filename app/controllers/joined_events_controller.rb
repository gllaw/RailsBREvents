class JoinedEventsController < ApplicationController
  def create
  	joined = JoinedEvent.new(user: session[:user_id], event: params[:id])

  					# User.find(session[:user_id]), event: Event.find(params[:id])) 	#pass the whole objects just to get their ID, Ruby will understand. Do this to prevent injection.
  	if joined.save
  	  redirect_to :back
    end
  end

  def destroy
  	JoinedEvent.find(params[:id]).delete
  	redirect_to :back
  end
end

# find all the ppl attending this event