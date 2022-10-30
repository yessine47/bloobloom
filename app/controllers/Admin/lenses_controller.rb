class Admin::LensesController < ApplicationController
    before_action :authorized
    before_action :admin
    before_action :set_lense, only: [:update, :destroy]

    # GET /lenses

    def index
      @lense = Lense.all
  
      render json: @lense
    end

    # POST /lenses

    def create
          @lense = Lense.new(lense_params)
      
          if @lense.save
            render json: @lense, status: :created
          else
            render json: @lense.errors, status: :unprocessable_entity
          end
    end
    
      # PATCH/PUT /lenses/1
    def update
          if @lense.update(lense_params)
            render json: @lense
          else
            render json: @lense.errors, status: :unprocessable_entity
          end
    end
    
      # DELETE /lenses/1
    def destroy
           @lense.destroy
    end
    
private
    # Use callbacks to share common setup or constraints between actions.
    def set_lense
        @lense = Lense.find(params[:id])
    end
    

    def lense_params
      params.permit(:Colour, :Prescription_type, :Description, :Lens_type, :Stock, :Price)
    end
   
end