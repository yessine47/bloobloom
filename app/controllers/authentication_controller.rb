class AuthenticationController < ApplicationController
    before_action :authorized, only: [:auto_login]

    # REGISTER
    def create
      @user = User.create(register_params)
      if @user.valid?
        token = encode_token({user_id: @user.id,IsAdmin:@user.IsAdmin})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid Email or password"}
      end
    end
    # REGISTER_Admin
    def createAdmin
      @user = User.create(register_params1)
      if @user.valid?
        token = encode_token({user_id: @user.id,IsAdmin:@user.IsAdmin})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid Email or password"}
      end
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(Email: params[:Email])
  
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id,IsAdmin:@user.IsAdmin})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid Email or password"}
      end
    end
  
  
    def auto_login
      render json: @user
    end
  
    private
  
    def register_params
      params.permit(:Name, :Email, :password, :Currency, :password_confirmation,)
    end
    private

    def register_params1
        defaults = { IsAdmin: true }
        params.permit(:Name, :Email, :password, :Currency, :password_confirmation).reverse_merge(defaults)
      end
  
  end