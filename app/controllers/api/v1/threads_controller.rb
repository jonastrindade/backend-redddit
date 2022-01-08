module Api
  module V1
    class Api::V1::ThreadsController < ApplicationController

      before_action :set_thread, only: [:show, :update, :destroy]      

      # Lucas index

      # GET /api/v1/threads/1
      def show
        render json: @thread
      end

      # POST /api/v1/threads
      def create
        @thread = Thread.new(thread_params)
        if @thread.save
          render json: @thread, status: :created
        else
          render json: @thread.errors, status: :unprocessable_entity
        end
      end

      # Lucas update
	  
	  # DELETE /api/v1/threads/1
      def destroy
        @thread.destroy      
      end

      private

        # Use callbacks to share common setup or constraints between actions.
        def set_thread
          @thread = Thread.find(params[:id])
        end
      
        # Only allow a trusted parameter "white list" through.
        def thread_params
          params.require(:thread).permit(:name, :description)
        end

    end
  end
end