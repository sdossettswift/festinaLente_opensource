class TimesheetsController < ApplicationController

  def new
    @events = Event.unsubmitted
    @timesheet = Timesheet.new
  end

  def submit_event
    @event = Event.find(params[:id])
    @event.update_attribute(:submitted, True)
  end

  def reject_event
    @event = Event.find(params[:id])
    @event.update_attribute(:submitted, False)
  end



end
