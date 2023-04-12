# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
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

  protected
  
  def customer_state
  # 入力されたemailからアカウントを1件取得
  @customer = Customer.find_by(email: params[:customer][:email])
  # アカウントを取得できなかった場合、このメソッドを終了する
  return if !@customer
  # 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @customer.valid_password?(params[:customer][:password])
    ## 【処理内容3】
    true && !false
    → true
    redirect_to new_customer_session_path

    true && !true
    → false
    
  end
  
  def reject_user
    @customer = Customer.find_by(name: params[:customer][:name])
    if @customer 
      if @customer.valid_password?(params[:customer][:password]) && (@user.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_user_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
  
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end