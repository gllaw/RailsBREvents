class UsersController < ApplicationController

  def new
  	@state = State.all
  end

  def create
  	user = User.new(user_params)
  	if user.save
  	  session[:user_id] = user.id
  	  session[:user_state] = user.state.to_i 	#it's the row ID as string...
  	  redirect_to "/events"
  	else
  	  flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def edit
  	@user = User.find(params[:id])
  	@state = State.all
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if (user.save)
      redirect_to "/events"
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end

end
