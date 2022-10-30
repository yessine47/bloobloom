class User::GlassesController < ApplicationController
  before_action :authorized
  before_action :user_auth
  
  before_action :set_frame, :set_lense, only: [:create]
  def index
    @glass = Glass.where(user_id:logged_in_user.id)
    render json: @glass
  end 
  
    def create
      if @frame.Stock > 0 && @lense.Stock > 0
        @glass = Glass.new(glass_params)
        @glass.Price = set_custom_glass_price
        @glass.user_id = logged_in_user.id
        if @glass.save
          reduce_stock_count
          render json: @glass
        else
          render json: { errors: @glass.errors.full_messages }, status: :unprocessable_entity
        end
      else
          if out_of_stock?(@frame)
            render json: { errors: "The selected frame is out of Stock" }
          elsif out_of_stock?(@lense)
            render json: { errors: "The selected lense pair is out of Stock" }
          end
      end
    end
   
  
    private
  
    def set_custom_glass_price
      @glass_price =  @frame.Price + @lense.Price 
      @price = Concurrency.convert(@glass_price,ENV['default_currency'], logged_in_user.Currency)
    end  
  
    def reduce_stock_count
      @frame = Frame.find_by(id: @glass.frame_id).decrement(:Stock)
      @lense = Lense.find_by(id: @glass.lense_id).decrement(:Stock)
      @frame.save
      @lense.save
    end  
  
    def set_frame
      @frame = Frame.find(params[:frame_id])
    end
  
    def set_lense
      @lense = Lense.find(params[:lense_id])
    end  
  
    def out_of_stock?(item)
      item.Stock == 0
    end
  
    def glass_params
        params.permit(:lense_id, :frame_id)
    end
  
  end