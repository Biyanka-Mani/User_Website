class UsersController < ApplicationController
  before_action :find_user,only:[:show]
  def index
    @users=User.all
  end
  def show
    
  end
  def login
    @user=User.new
  end
  def new
    @user=User.new
  end
  def autheticator
    @user = User.find_by(email: params[:user][:email])
    if @user.nil?
       flash[:alert] = "Invalid username"
       render :login, status: :unprocessable_entity
    else   
       if @user.password== params[:user][:password]
          flash[:notice]="Successful Login"
          redirect_to user_path(@user.id)
       else
          flash[:alert]="Unsuccessful Login"
          render :login, status: :unprocessable_entity
        end
    end
 end
  def create
    @user=User.new(user_params)
    
    if @user.save
      flash[:notice]="Registration Successfull"
      debugger
      redirect_to user_path(@user.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
   def find_user
      @user=User.find(params[:id])
   end
   def user_params
      params.require(:user).permit(:firstname, :lastname,:email,:password)
   end
end
