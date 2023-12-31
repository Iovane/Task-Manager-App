class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Profile for #{@user.username} was successfully created"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "User info was updated successfully"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end


  def destroy
    @user = User.find(params[:id])

    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated tasks successfully deleted"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
