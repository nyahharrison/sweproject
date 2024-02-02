class HomeController < ApplicationController
  def index
    @new_recipes = Recipe.order(created_at: :desc).limit(10)
    #@review = Review.new
    @recipes = Recipe.all
    filter_recipes if params[:recipe].present?
  end

  def search
    filter_recipes
    render :index
  end

  def show_result
    filter_recipes
    render :index
  end

  private

  def filter_recipes
    @meal_type = params.dig(:recipe, :meal_type)
    @dietary_restrictions = params.dig(:recipe, :dietary_restriction)

    @recipes = Recipe.all

    @recipes = @recipes.where(meal_type: @meal_type) if @meal_type.present?
    @recipes = @recipes.where("dietary_restrictions @> ARRAY[?]::varchar[]", @dietary_restrictions) if @dietary_restrictions.present?
  end
end
