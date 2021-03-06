class CommentsController < ApplicationController
  before_action :set_recipe

  def create
    @comment = @recipe.comments.create(comment_params)
    if current_user
      @comment.user_id = current_user.id
      @comment.save
    end
    redirect_to @recipe
  end

  def edit
    @comment = @recipe.comments.find(params[:id])
  end

  def update
    @comment = @recipe.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = @recipe.comments.find(params[:id])
    if @comment.destroy()
      flash[:success] =  "Successfully deleted comment."
    else
      flash[:error] = "Item could not be deleted."
    end
    redirect_to recipe_path(@recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params[:comment].permit(:content)
  end
end
