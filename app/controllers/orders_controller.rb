class OrdersController < ApplicationController
  def place
    @order = current_user.orders.last
    @amount = 0
    @quantity = 0
    @order.carts.each do |cart|
      @amount = @amount + cart.product.price
      @quantity = @quantity + cart.quantity
    end
    @order.update(amount: @amount)
    @order.update(quantity: @quantity)
    if @order.update(status: true)
      flash[:notice] = 'Your Order is Placed Successfully'
      redirect_to products_url
    else
      redirect_to carts_url
    end
 end
end
