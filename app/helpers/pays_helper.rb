module PaysHelper
  def current_pay
    @current_pay ||= Pay.find_by id: session[:pay_id]
  end
  def pay_id(pay)
    session[:pay_id]= pay.id
  end

end
