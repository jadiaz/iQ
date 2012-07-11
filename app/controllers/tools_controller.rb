class ToolsController < ApplicationController
  
  def index
    today = DateTime.now
    week_ago = today - 1.week
    this_month = (today - 1.month)...today

    case params[:filter]
    when 'week'
      @tools = Tool.where(:created_at.gte => week_ago)
    when 'month'
      @tools = Tool.where(created_at: this_month)
    when 'all'
      @tools = Tool.all
    else
      @tools = Tool.where(:created_at.gte => week_ago)
    end
  end

  def new
    @tool       = Tool.new
  end

  def edit
    @tool       = Tool.find(params[:id])
  end

  def create
    @tool = Tool.new(params[:tool])

    respond_to do |format|
      if @tool.save
        format.html { redirect_to tools_path, flash[:notice] => "Dude, you are awesome. You have added a tool." }
      else
        format.html { render :new, flash[:alert] => "Whoops something bad happened!" }
      end
    end
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes(params[:tool])
      flash[:notice] = "Your changes have been saved, good sir or madam."
      redirect_to tools_path
    else
      flash[:alert] = "Whoops, something bad happened!"
      redirect_to edit_tool_path(@tool)
    end
  end  
  
  def destroy
    if tool = Tool.find(params[:id])
      if current_user.can_administrate? or current_user == tool.user
        name = tool.name
        if tool.destroy
          flash[:notice] = "You've deleted the #{name}."
          redirect_to tools_path
          return
        else
          flash[:alert] = "Whoops, something bad happened!"
          redirect_to edit_tool_path(tool)
          return
        end  
      else
        flash[:alert] = "You are not allowed to delete tools you don't own"
        redirect_to edit_tool_path(tool)
        return
      end
    else
      flash[:alert] = "Could not find tool with id #{ params[:id] }."
      return
    end
  end

end
