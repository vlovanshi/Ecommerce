class ProductsController < ApplicationController
  before_action :get_product, only: %i[ show edit update destroy verify]
  def index
    @products = Product.all
  end

  def myproduct
    @products = current_seller.products.all   
  end

  def show
    @review = @product.reviews.new
    @reviews = @product.reviews
  end

  
  def new
   if current_seller.verified? 
     @product = current_seller.products.build
   else
     flash[:notice] = "Your Account is not verified yet kindly wait for the admin veryfication"
     redirect_to myproduct_path
   end
 end

  def edit; end
 
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
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy   
    redirect_to myproduct_path
  end
  private
    def product_params
      params.require(:product).permit(:name, :description, :product_number, :price, :quantity, avatars:[])     
    end
    def get_product
      @product = Product.find(params[:id])
    end
end
