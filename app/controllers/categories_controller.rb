class CategoriesController < ApplicationController
 before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_user.categories.order(:created_at)

    # count pending task
    @number_of_pending_tasks = {}
    @categories.each do |category|
      pending_tasks = category.tasks.where(completed: false).count
      @number_of_pending_tasks[category.id] = pending_tasks
    end
  end

    
  # User story #1: As a user, I want to create a category that can be used to organize my tasks.
  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)
      if @category.save
        redirect_to root_path, notice: 'Category was successfully created.'
      else
        render :new
      end
  end

  # User story #2: As a user, I want to edit a category to update the category's details.
  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  # User story #3: As a user, I want to view a category to show the category's details.
  def show
    # User story #6: As a user, I want to view a task to show task's details.
    # viewing list of task
    @tasks = @category.tasks.all
    # User story #8: As a user, I want to view my task for today for me to remind what are my priorities for today.
    # viewing task for today
    @tasks_today = @category.tasks.where("date >= ? AND date <= ?", Date.today.beginning_of_day, Date.today.end_of_day)
  end

  # Additional user story: As a user, I want to delete a category to better organize my tasks
  def destroy
    if @category.has_complete_and_incomplete_tasks?
        redirect_to category_path(@category), alert: "Cannot delete this category with both complete and incomplete tasks."
    else
      @category.destroy
        redirect_to categories_path, notice: "Category #{@category.title} successfully destroyed."
    end
  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def set_category
    @category = current_user.categories.find(params[:id])
  end

end
