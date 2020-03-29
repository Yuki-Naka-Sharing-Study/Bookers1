class BooksController < ApplicationController
	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def create
    # ストロングパラメーターを使用
    @book = Book.new(book_params)
    @books = Book.all
    # DBへ保存する
    if @book.save
    	flash[:notice] = "Book was successfully created"
    	redirect_to book_path(@book)
    else
    	render action: :index
    end
    end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		book.update(book_params)
		flash[:notice] = "Book was successfully updated"
		redirect_to book_path(book)
	end

	def destroy
	     book = Book.find(params[:id]) #データ(レコード)を1件取得
	     book.destroy #データ（レコード）を削除
	     flash[:notice] = "Book was successfully destroyed"
	     redirect_to books_path #List一覧画面へリダイレクト
	 end

	 private
	 def book_params
	 	 params.require(:book).permit(:title, :body)
	 end
end
