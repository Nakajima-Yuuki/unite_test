# frozen_string_literal: true

class Proposers::PasswordsController < Devise::PasswordsController
  before_action :ensure_normal_proposer, only: :create

  def ensure_normal_proposer
    if params[:proposer][:email].downcase == 'guest_proposer@example.com'
      redirect_to new_proposer_session_path, alert: 'ゲストファッショニスタのパスワード再設定はできません。'
    end
  end
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
