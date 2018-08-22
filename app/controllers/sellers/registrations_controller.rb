# frozen_string_literal: true

class Sellers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update, :edit]

   
  def create
     super
  end

   # GET /resource/edit
  def edit
     super
  end

   # PUT /resource
  def update
     super
  end
  protected

   # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, address_attributes: [:country, :state, :city, :postal_code]])
  end

    # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, address_attributes: [:country, :state, :city, :postal_code]])
  end

end
