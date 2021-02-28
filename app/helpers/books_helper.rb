module BooksHelper
  def book_author(book)
    user_logged_in? && current_user.id == book.user_id
  end
  def check_admin
    user_logged_in? && current_user.role == "admin"
  end
  
end
