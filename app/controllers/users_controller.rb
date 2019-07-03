class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.save
      flash[:notice] = 'User successfully created!'
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:alert] = @user.errors.full_messages
      render :new
    end
  end

	def edit
		@user = User.find(params[:email],params[:password_digest])
	end
end
