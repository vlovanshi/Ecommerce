class OrdersController < ApplicationController
  def place
    @order = current_user.orders.last
    @amount = 0
    @quantity = 0
    @order.carts.each do |cart|

      @quantity = @quantity + cart.quantity
            @amount = @amount + (cart.product.price* cart.quantity)

    end
    # @order.update(amount: @amount)
    # @order.update(quantity: @quantity)
     @order.update(amount: @amount, quantity: @quantity)
     
 end
end

     