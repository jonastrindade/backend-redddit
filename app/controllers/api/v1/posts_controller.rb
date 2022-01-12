module Api
  module V1
    class PostsController < ApplicationController

      before_action :set_post, only: [:show, :update, :destroy]      

      # GET /api/v1/posts
      def index
        @thread_id = params[:thread_id]
        @posts = Post.where(thread_id: @thread_id)
        render json: @posts
      end

      # GET /api/v1/posts/1
      def show
        render json: @post
      end

      # POST /api/v1/posts
      def create
        @post = Post.new(post_params)
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/posts/1
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
	  
	    # DELETE /api/v1/posts/1
      def destroy
        @post.destroy      
      end

      private

        # Use callbacks to share common setup or constraints between actions.
        def set_post
          @post = Post.find(params[:id])
        end
      
        # Only allow a trusted parameter "white list" through.
        def post_params
          params.require(:post).permit(:title, :description, :thread_id)
        end

    end
  end
end