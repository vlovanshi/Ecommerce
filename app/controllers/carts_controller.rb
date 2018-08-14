class CartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @cart = Cart.where(user_id: @user)
  end

  def show
   @cart_item = CartItem.all
  end

  def add_to_cart
    @user = current_user
    if !current_user.orders.exists?
      @order = current_user.orders.new()
      @order.save
    else
      @order = current_user.orders.last
    end
    @cart = @order.carts.new(user_id: @user.id)
    @cart.save
    @product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.new(product_id: @product.id)
    @cart_item.save
  end
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy 
    redirect_to cart_path
  end
  private 
    def cart_item_params
      params.require(:cart_item).permit(:product_id)
    end
end
