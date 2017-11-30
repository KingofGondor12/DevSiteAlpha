class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  end

  def create

    $customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => $customer.id,
      :amount      => ($game.price * 100).to_i,
      :description => "#{$game.title} purchased",
      :currency    => 'aud'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

    TransactionMailer.send_transaction

  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end
