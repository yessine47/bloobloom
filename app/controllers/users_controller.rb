class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :authorized, except: :create
    before_action :find_user, except: %i[create index]
    before_action :admin

    # GET /users
    def index
      @users = User.all
  
      render json: @users
    end
  
    # GET /users/1
    def show
      render json: @user
    end
  
    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @user.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find_by_id(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def user_params
        defaults = { IsAdmin: true }
        params.permit(:Name, :Email, :password, :Currency, :password_confirmation).reverse_merge(defaults)
      end
  
      def find_user
        @user = User.find_by_id(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { errors: 'User not found' }, status: :not_found
      end
end
