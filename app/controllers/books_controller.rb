class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
   else
       @books =Book.all
       render "index"  # ルーティングを通らず、viewページに飛ぶ。アクション無視
   end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
   else
    @books = Book.all
    render "edit"
   end
  end 

  def destroy
    book = Book.find(params[:id]) # データ（レコード）を1件取得
    book.destroy
    redirect_to books_path(book.id)
  end

 private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end