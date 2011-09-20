class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:email], params[:password])
        format.html { redirect_back_or_to(root_path, :notice => 'Sign in successfull.') }
        format.js
      else
        format.html { flash.now[:alert] = 'Email or password was incorrect.'; render :action => 'new' }
        format.js
      end
    end
  end

  def destroy
    logout
    redirect_to(root_path, :notice => 'Signed out!')
  end

end
