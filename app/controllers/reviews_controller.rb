class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:create]

  def create
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @recipe, notice: 'Review was successfully added.'
    else
      redirect_to @recipe, alert: 'Failed to add review.'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user == current_user
      @review.destroy
      redirect_to @review.recipe, notice: 'Review was successfully deleted.'
    else
      redirect_to @review.recipe, alert: 'You can only delete your own reviews.'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
