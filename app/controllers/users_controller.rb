class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :sign_in, only: [:show, :index, :edit, :update, :destroy]

  def index
    @users = User.all.to_a
  end

  def dashboard
     @projects = Project.all.to_a
     @clients = Client.all.to_a
     @events = @current_user.events.unbilled.all
     @expenses = @current_user.expenses.not_nil
     @prints = @current_user.prints.all.to_a
  end


  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	 # session[:user_id] = @user.id
    	redirect_to admin_path, notice: "User Created"
    else
    	 render :new
    end
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name, :role, :password_confirmation, :password_digest, :password)
    end

    def sign_in
      if @current_user.nil?
        redirect_to sign_in_path, alert: "Please Sign In"
      end
    end
end
