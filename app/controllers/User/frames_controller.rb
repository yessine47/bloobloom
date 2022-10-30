class User::FramesController < ApplicationController
    before_action :authorized
    before_action :user_auth
    def index
        @frames = Frame.where(Status: :active)
        render json: @frames
    end 
    end