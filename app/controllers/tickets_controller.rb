class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: %i[show edit update destroy]

  def new
    @ticket = @project.tickets.build
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to [@project, @ticket], notice: "Ticket has been updated." }
      else
        format.html do
          flash.now[:alert] = 'Ticket has not been updated.'
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def create
    @ticket = @project.tickets.build(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to [@project, @ticket], notice: 'Ticket has been created' }
      else
        format.html do
          flash.now[:alert] = 'Ticket has not been created.'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_ticket
    @ticket = @project.tickets.find_by(params[:id])
  end
end
