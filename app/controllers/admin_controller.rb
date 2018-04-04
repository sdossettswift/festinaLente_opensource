class AdminController < ApplicationController
  def dashboard
  	 @projects = Project.all.sorted
  	 @clients = Client.all.sorted
  	 @users = User.all.sorted
     @events = Event.all.sorted
     @expenses = Expense.not_nil
  end
end
