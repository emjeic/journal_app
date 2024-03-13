class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = current_user.categories.order(:created_at)
        # today's task
        @tasks = current_user.tasks.joins(:category).where(categories: { user_id: current_user.id })
        .where("tasks.date >= ?", Date.today.beginning_of_day)
        .where("tasks.date <= ?", Date.today.end_of_day)
        @categories = current_user.categories.all

        # count pending task
        @pending_tasks_count = {}
        @categories.each do |category|
        pending_tasks = category.tasks.where(completed: false).count
        @pending_tasks_count[category.id] = pending_tasks
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
        # viewing task
        @tasks = @category.tasks.where(date: Date.today.beginning_of_day..Date.today.end_of_day)
    end

# Additional user story: As a user, I want to delete a category to better organize my tasks
    def destroy
        @category.destroy
        redirect_to categories_path, notice: "Category #{@category.id} successfully destroyed.", status: :see_other
    end

    private

    def category_params
        params.require(:category).permit(:title, :description)
    end

    def set_category
        @category = current_user.categories.find(params[:id])
    end
end
