class UsersController < ApplicationController
  
  def index
   @book = Book.new
   @books = Book.all
   @user = current_user
  end
  
  def show
    @books = Book.all
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
   def update
    @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)  
   else
    @users = User.all
    render "edit"
   end
   
   end

 private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
