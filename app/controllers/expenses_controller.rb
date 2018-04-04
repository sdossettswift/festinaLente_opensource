class ExpensesController < ApplicationController
before_action :sign_in
  def index
    @expenses = @current_user.expenses.not_nil
  end

  def expense_report
    @expenses=@current_user.expenses.not_nil
    total =[]

    @expenses.each do |e|
      total << e.amount
    end
    @total = total.sum

    respond_to do |format|
        format.pdf do
          render pdf: "expense"   # Excluding ".pdf" extension.
        end
      end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = @current_user
    if @expense.save
      redirect_to dashboard_path
      flash[:notice]="Expense Logged"
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expenses = Expense.all.not_nil
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
  end

  def delete
    @expense = Expense.find(params[:print_id])
  end

  def destroy
    @expenses = Expense.all.to_a
    @expense = Expense.find(params[:id])
    @expense.destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:project_id, :user_id, :category, :vendor, :amount, :reimburseable, :mileage, :description, :date)
  end

end
