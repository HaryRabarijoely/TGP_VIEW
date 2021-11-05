class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @city = City.find(@user.city_id)
    @nb_gossips = Gossip.where(user_id: @user.id).count
    @nb_comments = Comment.where(user_id: @user.id).count
    @gossips_arrray = Gossip.where(user_id: @user.id)
  end

  def new
    @city = City.all.order(:name)
  end

  def edit
  end

  def create
    @user = User.new(first_name: params[:first_name], 
                    last_name: params[:last_name],
                    description: params[:description],
                    email: params[:email],
                    age: params[:age],
                    password: params[:password],
                    city: City.find(params[:city_id]))
    if params[:password] != params[:confirmpassword]
      flash.now[:danger] = "Passwords must match !"
      render :action => 'new' 
    end
    if @user.save # essaie de sauvegarder en base @gossip
        flash[:success] = "You successfuly created your account"
        redirect_to :controller => 'sessions', :action => 'new'
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      flash.now[:danger] = "Error with the account creation"
      render :action => 'new'
    end

  end

  def update
  end

  def destroy
  end
end
