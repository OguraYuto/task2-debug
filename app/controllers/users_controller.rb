class UsersController < ApplicationController

 before_action :baria_user, only: [:edit, :destroy, :update] #berore_actionはコントローラすべてのアクションが実行される前に実行されるもの

  def index
   @book = Book.new
   @books = Book.all.order(created_at: :desc)
   @user = current_user
   @users = User.all
  end

  def show
    @user = User.find(params[:id]) #定義する順番に気をつける。
    @books = @user.books #１人のユーザーのどのブックか分らないため記述
    @book = Book.new
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
    render "edit"
   end

   end

 private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


  def baria_user
    unless User.find(params[:id])  == current_user#もし受け取ったユーザーのIDが、ログインしているユーザー(current_user)のIDと一致しなければ処理を実行せずリダイレクトで戻します
        redirect_to user_path(current_user) #ユーザーの詳細ページにリダイレクト
    end
  end
end
