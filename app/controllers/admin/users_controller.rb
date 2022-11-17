class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @users = User.all
  end

  def check_admin
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end
end
