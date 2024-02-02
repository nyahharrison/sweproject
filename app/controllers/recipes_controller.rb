class RecipesController < ApplicationController
    protect_from_forgery with: :null_session
  
    before_action :authenticate_user!

    before_action :set_time_constraint, only: [:create, :filter]
    before_action :set_meal_type, only: [:create, :search]
    before_action :set_dietary_restriction, only: [:create, :search]
   
    def dummy
        # Dummy page logic here, e.g., render a view or display a message
        @message = "Welcome to the Dummy Page! This is accessible without authentication."
    end

    def new 
      @recipe = Recipe.new
    end


    def create
      @recipe = current_user.recipes.build(recipe_params)
    
      # Save ingredients to ingredients_list
      @recipe.ingredients_list = params[:recipe][:ingredients].split("\n") if params[:recipe][:ingredients].present?

      @recipe.image.attach(params[:recipe][:image]) if params[:recipe][:image].present?

      @time_constraint = params[:recipe][:time_constraint]
      @recipe.time_constraint = @time_constraint
      #@recipe.meal_type = params[:recipe][:meal_type]
      @recipe.meal_type = @meal_type
      @recipe.dietary_restrictions = params[:recipe][:dietary_restrictions]
      @recipe.dietary_restrictions = @dietary_restriction
    
      if @recipe.save
        flash[:notice] = "Recipe successfully created!"
        redirect_to root_path and return
      else
        puts @recipe.errors.full_messages
        flash[:alert] = "Creation failed."
        #render 'new'
      end
    end    

    def cancel
      redirect_to root_path # or any other path you want to redirect to
    end

    def show 
      @recipe = Recipe.find(params[:id])
      #@review = Review.new
      render 'home/index'
    end

    def search
      @meal_type = params.dig(:recipe, :meal_type)
      @dietary_restrictions = params.dig(:recipe, :dietary_restriction)

      @recipes = Recipe.all

      if @meal_type.present?
        @recipes = @recipes.where(meal_type: @meal_type)
      end

      if @dietary_restrictions.present?
        @recipes = @recipes.where("dietary_restrictions @> ARRAY[?]::varchar[]", @dietary_restrictions)
      end

      render 'home/index'

    end

    def index
      # add code for search functionality
      @recipes = Recipe.order(created_at: :desc).all
    end

    def destroy
      @recipe = current_user.recipes.find(params[:id])
      @recipe.destroy

      redirect_to root_path, notice: "Recipe was successfully deleted.", status: :see_other
    end

    def edit
      @recipe = current_user.recipes.find(params[:id])
    end
  
    def update
      @recipe = current_user.recipes.find(params[:id])
    
      if @recipe.update(recipe_params)
        flash[:notice] = "Recipe successfully updated!"
        redirect_to root_path  # Redirect to the show action
      else
        flash[:alert] = "Update failed."
        render 'edit', status: :unprocessable_entity
      end
    end    

    def cancel
      redirect_to root_path
    end
    

    def filter
      @time_constraint = params.dig(:recipe, :time_constraint)
      @recipes = Recipe.all
      if @time_constraint.present?
        @recipes = @recipes.where(time_constraint: @time_constraint)
      end
    
      render 'home/index'
    end

    private

    def set_time_constraint
      @time_constraint = params[:recipe]&.fetch(:time_constraint, nil)      
    end

    def set_meal_type
      @meal_type = params[:recipe]&.fetch(:meal_type, nil)
    end

    def set_dietary_restriction
      @dietary_restriction = params[:recipe]&.fetch(:dietary_restrictions, nil)
    end
      
    # def review_params
    #   params.require(:review).permit(:content, :rating)
    # end
      
    def recipe_params
      params.require(:recipe).permit(
        :title,
        :description,
        :image,
        :meal_type,
        :time_constraint,
        :ingredients_list,
        dietary_restrictions: []  # Permit as an array
      )
    end
    
    
end
