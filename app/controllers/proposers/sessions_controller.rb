# frozen_string_literal: true

class Proposers::SessionsController < Devise::SessionsController

  before_action :ensure_not_user

  def guest_sign_in
    proposer = Proposer.guest
    sign_in proposer
    redirect_to outfits_path, notice: 'ゲストファッショニスタとしてログインしました。'
  end

  def ensure_not_user
    redirect_to outfits_path, notice: 'アクセス権限がありません' if current_user.present?
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
