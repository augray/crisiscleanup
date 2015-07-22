class InvitationsController < ApplicationController
  include ApplicationHelper
  before_filter :check_token
  
  def activate
    @invitation = Invitation.where(token:params[:token]).first
  end

  def sign_up 
    inv = Invitation.where(token:params[:token]).first
    @user = User.new(email: params["user"]["email"],password: params["user"]["password"],password_confirmation: params["user"]["password"],name: params["user"]["name"], legacy_organization_id:inv.organization_id, referring_user_id:inv.user_id)
    if @user.save      
      redirect_to worker_dashboard_path
    else
      redirect_to :back
    end
  
  end
  
end
   