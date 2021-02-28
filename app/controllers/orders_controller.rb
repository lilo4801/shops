class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
    before_action :check_loggin,only: [:new,:create]
  before_action :check_has_card , only: [:new,:create]
  def new
    @order= current_user.orders.build
  end

  def create
    @order=current_user.orders.build(params_order)
    @order.price = @cart.total_price
    @order.status = current_pay.payment
    respond_to do |format|
      if @order.save
          current_cart.destroy
          format.html   { redirect_to root_path,notice: 'you paid successfully.'}
            format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  # Amount in cents
  if current_pay.payment =="online"
    @amount = @cart.total_price
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount*100,
      description: 'done',
      currency: 'usd',

    })

  end
end
private
  def params_order
    params.require(:order).permit(:address,:phone,:description,:price,:status)
  end
  def set_order
      @order= Order.find(params[:id])
  end
  def check_has_card
    if  current_cart.total_price == 0
        respond_to do |format|
        format.html { redirect_to root_path, notice: 'you should add something to cart.' }
        format.json { render :index, status: :created}
        end
   end
 end
 def check_loggin
      unless user_logged_in?
          redirect_to new_session_path,notice: "you should login to pay"
      end
 end




end
