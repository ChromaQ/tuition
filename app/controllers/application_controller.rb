class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  add_flash_types :success, :error
  helper :all
  # Allows admins to impersonate other users
  impersonates :user
  # NOTE: The next 2 lines are only required if your application required you to hit the perms database
  # before_action :get_user_perms?
  # before_action :has_access?

  private

  def require_superuser?
    return true if is_superuser?

    # if user is not a superuser (part of devgroup) redirect them back to the root_path
    flash[:notice] = 'You do not have the required privileges in order to access this page.'
    redirect_to root_path
  end


  # The rest of the perms stuff goes here
  # NOTE: If you plan on using perms you will need to add credentials to the database files and uncomment the connections in the perm Models
  def get_user_perms?
    return false unless current_user.present?

    # if you've already set perms or part of devgroup you shouldn't need to hit perms
    unless current_user.superuser
      # verify if the user is flagged in perms as a superuser
      user_perms = PermUser.select(:userid).find_by(ldapid: current_user.username)
      app_name = Rails.application.class.parent_name.downcase
      app_perms = PermApp.select(:admin, :perms).where(userid: user_perms.userid, appname: app_name).first
      return false if app_perms.nil?

      # if using rails style it should be a comma seperated ie: config,admin,views,etc
      # It its a CF app it should use XML/WDDX format
      perms = WDDX.load(app_perms[:perms])
      request.session['perms'] = perms.data["APPLIST"].split(',') unless perms.blank?
      # If you are using comma seperated string for perms
      #request.session['perms'] = app_perms
    end
  end

  def has_access?
    return false unless current_user.present?

    redirect_to :noaccess unless (request.session['perms'] && !request.session['perms'].blank?) || current_user.superuser?

    # set whatever permissions your app needs to do for perms here.
  end
end
