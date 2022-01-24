class BooksController < ApplicationController
  def new
     #インスタンス変数生成
  end
  
  def create
    @book = Book.new(book_params) #データ受け取りのインスタンス生成
    if @book.save       #データベースに保存するためのsaveメソッド実行
      
      flash[:create] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
      
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
   
  end

  def show
    @book = Book.find(params[:id])
    
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
  
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = 'Book was successfully update.'
      redirect_to book_path(@book.id)
      
      #redirect_to group_messages_path(@group), notice: 'メッセージが送信されました'
    else
      render :edit
    end
    
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:destroy] = 'Book was successfully destroyed.'
    redirect_to '/books'
  end
  
 
  
  private  #ストロングパラメータ
  def book_params
   params.require(:book).permit(:title, :body)
   #params.permit(:title, :body)
  end
  
end