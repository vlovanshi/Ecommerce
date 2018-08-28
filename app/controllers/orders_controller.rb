class OrdersController < ApplicationController
  skip_before_action :user_authenticate, only: [:stri]
  protect_from_forgery :except => [:stri]
  def place
    @order = current_user.orders.last
    @amount = 0
    @quantity = 0
    @order.carts.each do |cart|
      @quantity = @quantity + cart.quantity
      @amount = @amount + (cart.product.price* cart.quantity)
    end
    @order.update(amount: @amount, quantity: @quantity)
  end
  def stri
     
  end
end

     