class Admin::BaseController< ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_require

  private

  def admin_required!
    redirect_to root_path, alert: 'You are not an admin!' unless current_user.admin?
  end

end
