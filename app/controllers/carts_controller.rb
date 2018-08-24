class CartsController < ApplicationController
  before_action :set_order
  before_action :get_cart, only: %i[ edit update destroy show]
  before_action :get_product, only: %i[ add_to_cart ]
  def index    
    @carts = @order.carts
  end
  def edit    
  end

  def show
    
  end

  def add_to_cart
    if (!@product.cart.nil?) && (@order.carts.exists?(:id => @product.cart.id)) 
      @product.cart.increment! :quantity
      @total_price = (@product.cart.quantity)*(@product.price)
     @product.cart.update_attribute(:total_price, @total_price)
    else
      @cart = @order.carts.new(total_price: @product.price)
      @cart.save
      @cart_item = CartItem.new(product_id: @product.id, cart_id: @cart.id)
      @cart_item.save  
    end 
  end

  def update
    if @cart.update(cart_params)
      @total_price = (@cart.quantity)*(@cart.product.price)
      @cart.update_attribute(:total_price, @total_price)
      redirect_to @cart
    else
      render 'edit'
    end   
  end


  def destroy
    @cart.destroy
    redirect_to carts_url, notice: 'Product Removed successfully.'
  end
  private 
  def cart_params
    params.require(:cart).permit(:quantity)
  end
  def set_order
    if current_user.orders.exists?(status: false)
      @order = current_user.orders.find_by(status: false)
    else
      @order = current_user.orders.new
      @order.save
    end
  end
  def get_cart
   @cart = @order.carts.find(params[:id])
  end
  def get_product
    @product = Product.find(params[:product_id])
  end
end
 



 

