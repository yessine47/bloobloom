class User::LensesController < ApplicationController
  before_action :authorized
  before_action :user_auth
  def index
    @lense = Lense.all

    render json: @lense
  end
   
end