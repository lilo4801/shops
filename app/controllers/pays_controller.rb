class PaysController < ApplicationController
  def new
    @pay=current_user.pays.build
  end

  def create
    @pay=current_user.pays.build(paramns_pay)
    respond_to do |format|
      if @pay.save
              format.html{redirect_to new_order_path,notice: 'choose payment was successfully updated.'}
              format.json { render :show, status: :created, location: @pay }
              pay_id(@pay)
      else
              format.html { render :new }
              format.json { render json: @pay.errors, status: :unprocessable_entity }
      end
  end
end
  private
  def paramns_pay
    params.require(:pay).permit(:payment)
  end

end
