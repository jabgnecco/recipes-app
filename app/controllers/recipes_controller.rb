class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews.includes(:user)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params) # Associate recipe with the logged-in user
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      flash.now[:alert] = 'There was an error creating the recipe.'
      render :new
    end
  end

  def edit

  end

  def update

    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy

    @recipe.destroy
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :instructions, :category, :difficulty)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
