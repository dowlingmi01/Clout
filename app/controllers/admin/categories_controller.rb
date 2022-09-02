class Admin::CategoriesController < Admin::ApplicationController
	before_action :set_category, only: [:edit, :update, :destroy]  
	before_action :authenticate_user!, except: [:index, :show]


	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "Category has been created"
			redirect_to admin_categories_path
		else
			flash.now[:alert] = "Category has not been created"
			render "new"
		end
	end

	def edit
		
	end

	def update
		if @category.update(category_params)
			flash[:notice] = "Category has been updated"
			redirect_to admin_categories_path
		else
			flash[:alert] = "Category has not been updated"
			render "edit"
		end
	end

	def destroy
   		authorize @category, :destroy?
    	@category.destroy

	    respond_to do |format|
	      format.html { redirect_to surveys_url, notice: "Category was successfully destroyed." }
	      format.json { head :no_content }
    end

	end

	private

	def category_params
		params.require(:category).permit(:name, :summary)
	end

	def set_category
		@category = Category.find(params[:id])
	end
end
