class CategoriesController < ApplicationController
  before_action :authenticate_user!

  # GET /categories or /categories.json
  def index
    @user = current_user
    @categories = current_user.categories.order(created_at: :desc)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @user = current_user
    @category = Category.find(params[:id])
    @category_expense = @category.expenses
  end

  # GET /categories/new
  def new
    @user = current_user
    @category = Category.new
  end

  # GET /categories/1/edit
  # def edit; end

  # POST /categories or /categories.json
  def create
    @user = current_user
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    # @category.author = current_user

    if @category.save
      redirect_to categories_path, notice: 'New category has been created!'
    else
      error = @category.errors.full_messages[0]
      redirect_to new_category_path, notice: "#{error} Please try again."
    end

    # respond_to do |format|
    #   if @category.save
    #     format.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
    #     format.json { render :show, status: :created, location: @category }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @category.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  # def update
  #   respond_to do |format|
  #     if @category.update(category_params)
  #       format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @category }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @category.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.destroy
        format.html { redirect_to categories_url, notice: 'Category was successfully deleted.' }
        format.json { head :no_content }
      else
        format.html { render :new, alert: 'An error has occured while deleting category' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_category
  #   @category = Category.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
