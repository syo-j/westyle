# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end


  # shopの登録フォーム
  def shop
    @user = User.new
    @user.build_shop
  end

  def shop_edit
    @user = current_user
    @user.shop.id
  end

  # POST /resource
  def create
    super
    # resource.update(confirmed_at: Time .now.utc)# Welcomeメールを送信した上で、skip_confirmation!と同一処理を行い自動で認証クローズさせる
    @user = User.new(configure_sign_up_params)
    @user.save
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    @user = User.new(configure_account_update_params)
    @user.save
  end

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
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, :age, :photo, :height, :gender, :facebook_url,
      :twitta_url, :instaguram_url, :shop_id, :area_id,
      shop_attributes: [:phone, :hp_url, :user_id]])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :age, :photo, :height, :gender, :facebook_url,
      :twitta_url, :instaguram_url, :shop_id, :area_id,
      shop_attributes: [:phone, :hp_url, :user_id]])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
