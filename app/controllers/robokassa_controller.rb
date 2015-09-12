# coding: utf-8
class RobokassaController < Robokassa::Controller
  def success
    super
    @payment = Payment.find_by_id(params[:InvId])
    if @payment
      redirect_to dashboard_payment_path(@payment),
        :notice => "Ваш платеж на сумму #{@payment.amount.to_s} руб. успешно принят. Спасибо!"
    else
      redirect_to new_dashboard_payment_path,
        :error => "Не могу найти платеж по данному идентификатору"
    end
  end

  def fail
    super
    redirect_to dashboard_payments_path,
      :error => "Во время принятия платежа возникла ошибка. Мы скоро разберемся!"
  end
end