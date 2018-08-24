class ReviewsController < ApplicationController
  before_action :get_product
  def new   
  end
  def create
    @review = @product.reviews.new(review_params)
    @reviews = @product.reviews
    if @review.save
      redirect_to @product
    end  
  end

  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to @product
  end
  private
  def review_params
    params.require(:review).permit(:body).merge(user: current_user)     
  end
  def get_product
    @product = Product.find(params[:product_id])  
  end  
end
