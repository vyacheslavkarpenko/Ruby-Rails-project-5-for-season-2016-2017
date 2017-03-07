class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
      end
  end

  def login
    if params[:users] == nil
      return
    end

    @email = params[:users][:email]
    @logged_in = false
    @auth_message = ''
    @user = nil
    User.all.each do |user|
      if user.email == @email
        if user.compare_password(params[:user_password])
          @logged_in = true
          @user = user
          @auth_message = 'Success!'
        else
          @auth_message= 'Wrong data!'
        end
        break
      end
    end

    if @logged_in
      @token = Token.new
      @token.user_id = @user.id
      @token.token = @token.generate_token
      @token.save

      session[:auth_token] = @token.token
      redirect_to '/users/new'
    end

    flash[:notice] = @auth_message
  end

  def create
    @user = User.new
    @user.name = params[:users][:name]
    @user.email = params[:users][:email]
    @user.password_hash = @user.generate_hash_for_password(params[:user_password])
    @user.save

    redirect_to '/users/login'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
