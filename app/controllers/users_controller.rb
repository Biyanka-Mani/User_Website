class UsersController < ApplicationController
  before_action :find_user,only:[:show,:edit,:update,:destroy]
  before_action :require_user,except: [:new,:create]
  before_action :require_same_user,only: [:edit,:update,:destroy]
  #before_action :require_same_user,except: [:index,:show,:new,:create,:dashboard]
  def index
    @users=User.paginate(page: params[:page], per_page: 5)
  end
  def show
    
  end
  def edit
  end
  def dashboard 
  end
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if @user.save
      flash[:notice]="Registration Successful"
      if session[:user_id]==nil
        session[:user_id]=@user.id
        redirect_to dashboard_path
      else
        redirect_to user_path(@user.id)
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice]="User Profile is Updated"
      redirect_to user_path(@user)
    else
      render :edit,status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    session[:user_id]=nil if @user==current_user
    flash[:notice]="User is Deleted Successfully"
    # redirect_to root_path if @user==current_user
    # redirect_to users_path
    redirect_to @user==current_user ? root_path : users_path
  end
  private
   def find_user
      @user=User.find(params[:id])
   end
   def user_params
      params.require(:user).permit(:firstname, :lastname,:email,:password)
   end
   def require_same_user
    if current_user != @user && !current_user.admin?
       flash[:alert]="You can only edit/Delete Your profile"
       redirect_to user_path(@user)
    end
end
end
