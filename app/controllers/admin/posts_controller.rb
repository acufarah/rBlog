class Admin::PostsController < Admin::ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)

    if params[:post][:image].blank?
      @post.image = nil
    end  

    if @post.save
      flash[:notice] = 'Post Created'
      redirect_to admin_posts_path
    else 
      render 'new' 
    end   
  end

  def edit
    @post= Post.find(params[:id])
  end

  def update
    @post= Post.find(params[:id])

    if params[:post][:image].blank?
      @post.image = nil
    end  

    if @post.update(post_params)
      flash[:notice] = 'Post Updated'
      redirect_to admin_posts_path
    end 
  end

  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    flash[:notice]= 'Post Removed'

      redirect_to admin_posts_path
  end

  def index
    if params[:search]
      @posts= Post.all.search(params[:search]).order('created_at DESC')
    else 
      @posts= Post.all.order('created_at DESC')
    end
  end

  def show
    @post= Post.find(params[:id])
    @post.show
  end

  
  private

    

      # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :category_id, :user_id, :tags, :image, :body)
    end
 
end
