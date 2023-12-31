class ExpensesController < ApplicationController
  # GET /expenses/new
  def new
    @expense = Expense.new
    @categories = Category.all
    @category = Category.find(params[:category_id])
  end

  # POST /expenses or /expenses.json
  def create
    @expense = current_user.expenses.new(expense_params)
    @expense.author_id = current_user.id

    respond_to do |format|
      if @expense.save
        category = Category.find(params[:expense][:category_id])
        @expense.categories << category

        format.html { redirect_to category_path(id: params[:category_id]) }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :category)
  end
end
