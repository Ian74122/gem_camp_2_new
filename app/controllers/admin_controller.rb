class AdminController < ActionController::Base
  before_action :check_admin
  before_action :authenticate_user!
  
  def check_admin
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end
end
