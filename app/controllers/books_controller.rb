class BooksController < ApplicationController
      before_action :set_book, only: [:show, :edit, :update, :destroy]
      http_basic_authenticate_with email: "admin@admin.com", password: "password", name:"Admin123" ,except: [:show, :index]
  def index
    @books=Book.all
  end
  def show

  end
  def new
    @book= current_user.books.build
  end
  def edit

  end
  def create
    @book= current_user.books.build(params_book)
    if @book.save
      redirect_to books_path,notice:"Book was successfully created "
    else
      render :new,notice:"failed"
    end
  end
  def update
    if @book.update(params_book)
      redirect_to book_path(@book),notic:"Book was updated"
    else
      render :edit,notice:"Failed"
    end
  end
  def destroy
    @book.destroy
    flash[:notice]='Book was successfully destroyed.'
    redirect_to books_path
  end
  private
  def set_book
    @book=Book.find(params[:id])
  end
  def params_book
    params.require(:book).permit(:namebook,:nameauthor,:price,:description,:image)
  end
end
