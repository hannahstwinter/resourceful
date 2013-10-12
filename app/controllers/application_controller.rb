class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def all_tags
    tags = Array.new
    Tags.all.each do |t|
      tags << t.tag
    end
    return tags
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  helper_method :current_user, :all_tags
end
