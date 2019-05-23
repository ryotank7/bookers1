class PostsController < ApplicationController
  def index
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def create
        post = Post.new(post_params)
        post.save
        flash[:notice] = "book was successfully created "
        redirect_to post_path(post)
    end


  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	redirect_to post_path
  end

  def destroy
        post = Post.find(params[:id])
        flash[:notice] = "book was destroied"
        post.destroy
        redirect_to new_post_path
  end

  private

    def post_params
        params.require(:post).permit(:title, :body)
    end

end
