class UsersController < ApplicationController
  def new
    @user = User.new
  end

	def index
		@user = User.new
	end

	def edit
		@user = User.find(params[:email],params[:password_digest])
	end
end
