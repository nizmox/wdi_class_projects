class TasksController < ApplicationController
  def index
    @tasks = Task.all

    # respond differently if the request is for json format
    respond_to do |format|
      format.html
      format.json {render :json => @tasks}
    end
  end

  def create
    # binding.pry
    task = Task.new(params[:task])

    if task.save
      # return the object back in the response
      render :json => task.to_json
    else
      render :json => false
    end
  end

  def update
    task = Task.find(params[:id])

    task.update_attributes(params)

    if task.save
      # return the object back in the response
      render :json => task.to_json
    else
      render :json => false
    end
  end

  def destroy
    # binding.pry
    task = Task.find(params[:id])

    if task.destroy
      # return the object back in the response
      render :json => task.to_json
    else
      render :json => false
    end

  end
end
