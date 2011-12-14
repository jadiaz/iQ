class ApplicationController < ActionController::Base
  protect_from_forgery

  # method to act like devise
  def authenticate_user!
    if current_user.nil?
      redirect_to login_url, :alert => "You must first sign in to access this page"
    end
  end

  protected

  def not_authenticated
    redirect_to sign_in_path, :alert => "Please sign in first."
  end

end
