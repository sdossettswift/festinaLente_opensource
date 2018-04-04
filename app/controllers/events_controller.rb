class EventsController < ApplicationController
  before_action :sign_in

  def index
    @events = @current_user.events.has_dates.sorted
    @unsubmitted_events = @current_user.events.has_dates.unbilled.unsubmitted.sorted
    @submitted_events = @current_user.events.has_dates.unbilled.submitted.sorted

    unsubmitted_duration=[]
    @unsubmitted_events.each do |e|
      unsubmitted_duration << e.duration_hours
    end
    @unsubmitted_hours = unsubmitted_duration.sum

    submitted_duration=[]
    @submitted_events.each do |e|
      submitted_duration << e.duration_hours
    end
    @submitted_hours = submitted_duration.sum

  end

  def timesheet
      @events = @current_user.events.unbilled.submitted.has_dates.sorted
      duration = []

      @events.each do |e|
        duration << e.duration_hours
      end
      @duration = duration.sum

    respond_to do |format|
        format.html
        format.csv { send_data @events.to_CSV }
        format.pdf do
          render pdf: "timesheet"   # Excluding ".pdf" extension.
        end
      end
  end

  def weekly
    @events = @current_user.events
  end


  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user = @current_user
    if @event.save
      flash[:notice]="Event Added"
    else
      flash[:notice]="Error"
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if !@event.submitted
      @event.update(event_params)
      flash[:notice]="Entry has been updated."
    else
      flash[:notice]="Entry cannot be updated because it is already submitted."
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  def submit
    @event = Event.find(params[:id])
    if @event.update_attribute(:submitted, true)
    redirect_to events_path
    flash[:notice]="Event Added"
    else
      render 'index'
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :date_range, :start, :end, :color, :user_id, :phase, :description, :project_id)
  end
end
