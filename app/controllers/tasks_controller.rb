class TasksController < ApplicationController
  before_action :set_category, only: [:new, :create, :show, :edit, :update, :destroy, :delete_all]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @category.tasks.order(id: :asc)
  end

  # User story #4: As a user, I want to create a task for a specific category so that I can organize tasks quicker.
  def new
    @task = @category.tasks.new
  end

  def create
    @task = @category.tasks.new(task_params)
    @task.completed = false
    @task.user = current_user
    if @task.save
      redirect_to category_path(@category), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # User story #5: As a user, I want to edit a task to update task's details.
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to category_path(@category), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
    
  # User story #7: As a user, I want to delete a task to lessen my unnecessary daily tasks.
  def destroy
    @task.destroy
    redirect_to category_path(@category), notice: "Task #{@task.task} successfully destroyed.", status: :see_other
  end

  # delete all tasks
  def delete_all
    @category.tasks.delete_all
    redirect_to category_path(@category), notice: "All tasks successfully deleted."
  end


  private
  def task_params
    params.require(:task).permit(:task, :body, :date, :completed)
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])  
  end

end
