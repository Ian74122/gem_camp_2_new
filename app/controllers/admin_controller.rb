class AdminController < ActionController::Base
  before_action :check_admin
  before_action :authenticate_user!
  include Pundit
  def check_admin
    raise ActionController::RoutingError.new('Not Found') unless current_user.admin?
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default,
                      username: exception.policy.record&.user&.email
    redirect_to(request.referrer || root_path)
  end

  def pundit_user
    current_user
  end
end
