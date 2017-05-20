class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

  def index
    @user = User.find_by id: current_user.id
    @posts = @user.posts.order_by_created
  end

  def new
    @post = current_user.posts.build
  end

  def show
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :post_img)
  end

  def find_post
    @post = Post.find_by id: params[:id]
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
