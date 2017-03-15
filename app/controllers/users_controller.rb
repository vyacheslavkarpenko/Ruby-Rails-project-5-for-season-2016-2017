class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  
  def create
    @user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Welcome! Now you can sign in."
  	else
  		flash[:alert] = "There was a problem creating your account. Try again!"
  	end
  	redirect_to sign_in_path

  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "Sucessfully updated profile."
    else
      redirect_to edit_user_path(@user), alert: "There was an issue"
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "User successfully deleted."
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :password)
  end
end
