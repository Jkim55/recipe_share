class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except:[:index, :show]

  # def index
  #   @recipe = Recipe.all.order("created_at DESC")
  # end

  def index
    @recipe = Recipe.all
    if params[:search]
      @recipe = Recipe.search(params[:search]).order("created_at DESC")
    else
      @recipe = Recipe.all.order('created_at DESC')
    end
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to @recipe, notice:"Successfully created new recipe"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy()
    redirect_to root_path, notice: "Successfully deleted recipe"
  end

  def upvote
    @recipe.upvote_by current_user
    redirect_to :back
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :serving, :image, category_ids: [] , course_ids: [], ingredients_attributes: [:id, :name, :image, :_destroy], directions_attributes: [:id, :step, :attachment, :dir_image, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
