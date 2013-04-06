class CommentsController < ApplicationController
  def new
  @post = Post.find(params[:my])
  @comment = Comment.new(:post_id => @post.id)
  @comments = @post.comments
end

def create
  @comment = Comment.new(params[:comment])
  @comment.save
  redirect_to new_comment_path( :my => @comment.post_id )
end

def destroy
  @comment=Comment.find(params[:id])
  post_id = @comment.post_id
  @comment.destroy
  flash[:notice]="Post deleted"
  redirect_to new_comment_path(:my => post_id)
end

end
