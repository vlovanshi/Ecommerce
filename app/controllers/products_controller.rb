class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_seller.products.new
  end

  def edit
    @product = Product.find(params[:id])
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

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
   
    redirect_to products_path
  end
  private
    def product_params
      params.require(:product).permit(:name, :description, :product_number, :price, :quantity, :avatar)
      
    end
end
