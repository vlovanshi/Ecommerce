class ApplicationController < ActionController::Base
  before_action :user_authenticate
  private
  def user_authenticate
    authenticate_user! 
  end
  
end
