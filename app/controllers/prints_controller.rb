class PrintsController < ApplicationController

  before_action :sign_in

  def index
    @prints = @current_user.prints.all
    ## keep query in controller, not view
  end

  def show
    @print = Print.find(params[:id])
  end

  def new
    @print = Print.new
  end

  def create
  	@print = Print.new(print_params)

    @print.user = @current_user
    if @print.save
        redirect_to dashboard_path
        flash[:notice]="Print Logged"
    else
      render 'new'
    end
  end

  def edit
    @print = Print.find(params[:id])
  end

  def update
    @prints = Print.all.to_a
    @print = Print.find(params[:id])

    @print.update_attributes(print_params)
  end

  def delete
    @print = Print.find(params[:print_id])
  end

  def destroy
    @prints = Print.all.to_a
    @print = Print.find(params[:id])
    @print.destroy
  end

private
	def print_params
		params.require(:print).permit(:project_id, :device, :page_count, :notes, :date, :user_id, :cost, :color, :scan, :print_format)
	end
end
