class RiskStatusesController < ApplicationController
  layout 'admin'

  before_filter :require_admin

  def index
    @issue_statuses = RiskStatus.ordered
    render action: :index, layout: false if request.xhr?
  end

  def new
    @risk_status = RiskStatus.new
  end

  def create
    @risk_status = RiskStatus.new(risk_params)

    if @risk_status.save
      flash[:notice] = t(:notice_successful_create)
      redirect_to plugin_settings_path(:redmine_risk_management)
    else
      render action: :new
    end
  end

  def edit
    @risk_status = RiskStatus.find(params[:id])
  end

  def update
    @risk_status = RiskStatus.find(params[:id])

    if @risk_status.update_attributes(risk_params)
      flash[:notice] = t(:notice_successful_update)
      redirect_to plugin_settings_path(:redmine_risk_management)
    else
      render action: :edit
    end
  end

  def destroy
    RiskStatus.find(params[:id]).destroy
    flash[:notice] = t(:notice_successful_delete)
    redirect_to plugin_settings_path(:redmine_risk_management)
  rescue
    flash[:error] = t(:error_unable_delete_risk_status)
    redirect_to plugin_settings_path(:redmine_risk_management)
  end

  private

  def risk_params
    params.require(:risk_status).permit(:name, :color_name, :status_type, :is_default, :position)
  end

end
