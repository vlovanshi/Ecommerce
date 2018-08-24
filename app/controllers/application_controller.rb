class ApplicationController < ActionController::Base
  before_action :user_authenticate
  before_action :carts_count
  private
  def user_authenticate
    authenticate_user! 
  end
  def carts_count
    if user_signed_in?
      @count = current_user.orders.find_by(status: false).carts.count

    end
  end
end
