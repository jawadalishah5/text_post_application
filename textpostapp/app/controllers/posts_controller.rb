class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = current_user.posts.order(created_at: :desc)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
    
        respond_to do |format|
          if @post.save
            format.html { redirect_to root_path, notice: 'Post was successfully created.' }
            format.json { render :index, status: :created, location: @post }
            format.js
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        respond_to do |format|
          if @post.update(params.require(:post).permit(:content, :media))
            format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
            format.json { render :show, status: :ok, location: @post }
            format.js   # This will render update.js.erb
          else
            format.html { render :edit }
            format.json { render json: @tweet.errors, status: :unprocessable_entity }
            format.js   # This will render update.js.erb with errors
          end
        end
    end
    

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        respond_to do |format|
          format.html { redirect_to posts_path }
          format.js
        end
    end

    def show
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:content, :media)
    end

end
