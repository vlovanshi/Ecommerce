class ApplicationController < ActionController::Base
  def define
    if user_signed_in? 
      before_action :authenticate_user!, except: %i[index show]
    else
     before_action :authenticate_seller!, except: %i[index show]
    end
  end
end
