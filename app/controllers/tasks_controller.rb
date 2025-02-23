class TasksController < ApplicationController
    before_action :set_task, only: [:show,:edit, :update, :delete]

    def index
        if params[:status].present?
            @tasks= Task.where(status: params[:status])
        else
            @tasks = Task.all
        end



        if params[:sort_by] == 'created_at'
            @tasks = @tasks.order(created_at: :desc) # newest tasks first
          elsif params[:sort_by] == 'updated_at'
            @tasks = @tasks.order(updated_at: :desc) # most recently updated tasks first
          else
            @tasks = @tasks.order(created_at: :desc) # default to sorting by created_at
          end

    end

    def new
        @task =Task.new()
    end

    def show
    end

    def create
        @task =Task.new(task_params)
        if @task.save
            redirect_to @task, notice:"Task succesfuly created"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            redirect_to @task, notice:"Task was succesfully updated"
        else
            render :edit
        end
    end

    def delete
        @task.destroy
        redirect_to @tasks, notice:"Task deleted succesfully"
    end

    private

    def task_params
        params.require(:task).permit(:name, :description, :status)
    end

    def set_task
        @task = Task.find(params[:id])
    end



end
