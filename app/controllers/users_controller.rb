class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status:  :unprocessable_entity
    end
  end

  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def update
   id = params[:id]
   @user = User.find(id)
   @user.update(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
  #  redirect_to "http://www.rubyonrails.org", allow_other_host: true
  end

  private

  def user_params
    params.expect(user: [ :username, :email, :password ])
  end
end
