class Admin::UsersController < Admin::ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'New User Added'
      redirect_to admin_users_path
    else 
      render 'new' 
    end   
  end

  def edit
    @user= User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = 'User Updated'
      redirect_to admin_users_path
    else 
      render 'edit'  
    end 
  end
  def destroy
    @user= user.find(params[:id])
    @user.destroy
    flash[:notice]= 'User Information Deleted'

      redirect_to admin_users_path
  end

  def index
    if params[:search]
      @users= User.search(params[:search]).all.order('created_at DESC')
    else 
      @users=User.all.order('created_at DESC')
    end
  end

  def show
    @user= User.find(params[:id])
    @user.show
  end

  
  private

    

      # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
   
end

