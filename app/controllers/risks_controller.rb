class RisksController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id

  def index
  end

  def new
    @risk = Risk.new
  end

  def create
    @risk = Risk.new params[:risk]
    @risk.project = @project
    @risk.user    = User.current

    if @risk.save
      flash[:notice] = t(:notice_successful_create)
      respond_to do |format|
        format.html { redirect_to project_risks_path(@project) }
        format.api  { render action: :index, status: :created, location: project_risks_path(@project) }
      end
    else
      respond_to do |format|
        format.html { render action: :new }
        format.api  { render_validation_errors(@risk) }
      end
    end

  end

end
