class PaymentsController < ApplicationController

  def create
    @payment = current_user.payments.create!(:amount => params[:payment][:amount])
    pay_url = $robokassa.init_payment_url(
      @payment.id, @payment.amount, "Платеж № #{@payment.id}",
      '', 'ru', current_user.email, {}
    )
    redirect_to pay_url
  end
end