class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.update(done: true)
    @task.save
    redirect_to list_path(@list)
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end

end
