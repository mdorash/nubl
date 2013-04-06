class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by{|post| post.rating}.reverse

  end
  def new
    @post=Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.rating = 0
    if @post.save
      flash[:notice]="Post created"
      redirect_to posts_path
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    flash[:notice]="Post deleted"
    redirect_to posts_path
  end

  def show
    @post=Post.find(params[:id])
    @comments = Comment.all
  end

  def like
    @post = Post.find(params[:post_id])
    @post.rating = @post.rating+1
    @post.save
    redirect_to posts_path
  end
end