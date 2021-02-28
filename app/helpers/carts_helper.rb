module CartsHelper
  def current_cart
    @current_cart ||= Cart.find_by id: session[:cart_id]
  end
  def card_id(cart)
    session[:cart_id]= cart.id
  end

end
