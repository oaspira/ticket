class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
    @tickets = @tickets.for_period(@start_date, @end_date)
  end

  private

  def filter_by_period
    return unless params[:start_date].present? && params[:end_date].present?

    @start_date = params[:start_date]
    @end_date = params[:end_date]

    true
  end
end
