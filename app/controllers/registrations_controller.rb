# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  layout 'devise_layouts'

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :profession, :avatar)
  end
end
