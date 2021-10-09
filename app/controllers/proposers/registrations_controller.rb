# frozen_string_literal: true

class Proposers::RegistrationsController < Devise::RegistrationsController
  
  before_action :authenticate_proposer!
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  before_action :ensure_normal_user, only: %i[update destroy]
  before_action :ensure_not_user

  def ensure_normal_proposer
    if resource.email == 'guest@example.com'
      redirect_to outfits_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  def ensure_not_user
    redirect_to outfits_path, alert: 'アクセス権限がありません' if current_user.present?
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar ])
   end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    proposer_path(id: current_proposer.id)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
