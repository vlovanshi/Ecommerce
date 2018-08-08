class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end
  def new
    
  end
 
  def create
    @product = current_seller.products.new(product_params)
    if @product.save
      flash[:notice] = "Successfully Added product"
      redirect_to @product
    else
      render :new
    end
  end
  private
    def product_params
      params.require(:product).permit(:name, :description, :product_number, :price, :quantity)
      
    end
end
