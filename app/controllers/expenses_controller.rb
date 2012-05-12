class ExpensesController < ApplicationController
  def index
    @expense = Expense.new
    @expenses = Expense.all
  end

  def create
    @expense = Expense.create
    @expense.description = params[:expense][:description]
    @expense.amount = params[:expense][:amount]

    if @expense.save
      flash[:notice] = "Expense tracked successfully!"
      redirect_to expenses_path
    else
      @expenses = Expense.all
      flash[:error] = "There was a problem tracking the expense"
      render :index
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.description = params[:expense][:description]
    @expense.amount = params[:expense][:amount]

    if @expense.save
      flash[:notice] = "Expense updated successfully!"
    else
      @expenses = Expense.all
      flash[:error] = "There was a problem updating the expense"
    end

    redirect_to expenses_path
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:notice] = "Expense deleted successfully!"
    redirect_to expenses_path
  end
end
