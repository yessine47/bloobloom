class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    before_action :authorized

  def encode_token(payload)
    JWT.encode(payload,ENV['SECRET_KEY'])
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(auth_header,ENV['SECRET_KEY'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end
  def is_admin?
    if decoded_token
    is_admin= decoded_token[0]['IsAdmin']
    end
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
  def admin
    render json: { message: 'unauthorized' }, status: :unauthorized unless is_admin?
  end
  def user_auth
    render json: { message: 'unauthorized' }, status: :unauthorized unless (is_admin? == false)
  end
end

