class ApprovalsController < ApplicationController
  before_action :get_seller, only: [:verify]

  def index
    @sellers = Seller.all.order("created_at DESC")
  end

  def verify
    @seller.update_columns(verified: true)
    redirect_to approvals_path
  end
  private
  def get_seller
    @seller = Seller.find(params[:id])
  end
end

