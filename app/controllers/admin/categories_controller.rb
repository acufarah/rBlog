class Admin::CategoriesController < Admin::ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category Created'
      redirect_to admin_categories_path
    else 
      render 'new' 
    end   
  end

  def edit
    @category= Category.find(params[:id])
  end

  def update
    @category= Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = 'Category Updated'
      redirect_to admin_categories_path
    end 
  end

  def destroy
    @category= Category.find(params[:id])
    @category.destroy
    flash[:notice]= 'Category Removed'

      redirect_to admin_categories_path
  end

  def index
    @categories= Category.all
  end

  def show
    @category= Category.find(params[:id])
    @category.show
  end

  
  private

    

      # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
   
end
