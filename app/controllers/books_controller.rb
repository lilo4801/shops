class BooksController < ApplicationController
      before_action :set_book, only: [:show, :edit, :update, :destroy]
      before_action :check_admin,only: [:new,:edit,:update,:destroy]
  def index
    @books=Book.all
  end
  def search
    @books= Book.where("namebook LIKE ? ", "%" +params[:search]+"%")
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
  def check_admin
    unless user_logged_in? && current_user.role == "admin"
      respond_to do |format|
          format.html {redirect_to root_path ,notice: "you dont belong here"}
          format.json {render :index,status: :unauthorized }
      end
    end
  end
end
