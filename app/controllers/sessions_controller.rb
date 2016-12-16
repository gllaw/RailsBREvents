class SessionsController < ApplicationController
  def create												#log in
  	user = User.find_by_email(user_params[:email])
  	if (user)
      if (user.authenticate(user_params[:password]))
        session[:user_id] = user.id
  	    session[:user_state] = user.state 	#it's the row ID as string...
  	    redirect_to "/events"
      else
        flash[:error] = "Invalid"
        redirect_to :back
      end
    else
      flash[:error] = "Please register first."
      redirect_to :back
    end
  end

  def join_event
  	
  end

  def destroy												#log out
  	reset_session
  	redirect_to :root
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password)
  end

end
