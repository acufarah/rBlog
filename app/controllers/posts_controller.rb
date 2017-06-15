class PostsController < ApplicationController
  def index
  	if params[:search]
      @posts = Post.search(params[:search]).order('created_at DESC')

    else
      @posts = Post.all.order('created_at DESC')

    end
    @categories = Category.all  
  end


  def show
  	@post = Post.find(params[:id])
  
  	@categories = Category.all
  	@comment = Comment.new
  	@comments = Comment.all
  end
end
