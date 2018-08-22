class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  def index    
    @cart = current_user.orders.last.carts
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    if (!@product.cart.nil?) && (@order.carts.exists?(:id => @product.cart.id)) 
      @product.cart.increment! :quantity
    else
      @cart = @order.carts.new()
      @cart.save
      @cart_item = CartItem.new(product_id: @product.id, cart_id: @cart.id)
      @cart_item.save  
    end 
  end

  def update
    @cart = Cart.find(params[:id]) 
    if @cart.update(cart_item_params)
      redirect_to @cart
    else
      render 'edit'
    end   
  end

  def destroy
    @cart = Cart.find(params[:id]) 
    @cart.destroy
    redirect_to carts_url, notice: 'Product Removed successfully.'
  end
  private 
  def cart_item_params
      params.permit(:product_id)
    end
    def set_order
    if current_user.orders.exists?
      @order = current_user.orders.last
    else
      @order = current_user.orders.new
      @order.save
    end
  end
end

