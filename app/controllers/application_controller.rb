class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CurrentCart
  include CartsHelper
  include PaysHelper
  before_action :set_cart
end
