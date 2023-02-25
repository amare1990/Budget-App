class CategoriesController < ApplicationController
  load_and_authorize_resource except: %i[create]
  before_action :set_category, only: %i[show edit update destroy]
  before_action :set_user

  def index
    @categories = @user.categories.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)
    @category.user = @user

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :user_id, :image)
  end
end
