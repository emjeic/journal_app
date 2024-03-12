class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:new, :create]
  before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
      @tasks = @category.tasks
    end

    def new
      @task = @category.tasks.new
    end
# User story #4: As a user, I want to create a task for a specific category so that I can organize tasks quicker.
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
      redirect_to [@category, @task], notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
    

  def destroy
    @task.destroy
    redirect_to category_path(@category), notice: "Task #{@task.task} successfully destroyed.", status: :see_other
  end

  def update_completed
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
    redirect_to category_path(@task.category)
  end


    private
    def task_params
        params.require(:task).permit(:task, :body, :date, :completed)
    end

    def set_category
      @category = current_user.categories.find(params[:category_id])
    end

    def set_task
      @category = current_user.categories.find(params[:category_id])
      @task = @category.tasks.find(params[:id])  
    end
end
