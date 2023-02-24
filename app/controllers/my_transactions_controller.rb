class MyTransactionsController < ApplicationController
  load_and_authorize_resource

  before_action :set_my_transaction, only: %i[show edit update destroy]

  before_action :set_user
  before_action :set_category
  before_action :set_category_my_transaction
  before_action :set_categories

  # GET /my_transactions or /my_transactions.json
  def index
    # authorize! :manage, @category
    # @my_transactions = MyTransaction.all
    @my_transactions = @category.my_transactions.order(created_at: :desc)
    @category_my_transactions = @category.category_my_transactions
  end

  # GET /my_transactions/1 or /my_transactions/1.json
  def show; end

  # GET /my_transactions/new
  def new
    @my_transaction = MyTransaction.new
  end

  # GET /my_transactions/1/edit
  def edit; end

  # POST /my_transactions or /my_transactions.json
  def create
    @my_transaction = MyTransaction.new(my_transaction_params)
    @my_transaction.user = @user
    @my_transaction.category_ids = params[:my_transaction][:category_ids]

    respond_to do |format|
      if @my_transaction.save
        CategoryMyTransaction.create!(category_id: @category.id, my_transaction_id: @my_transaction.id)
        format.html do
          redirect_to category_my_transactions_url(category_id: @category.id),
                      notice: 'My transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @my_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_transactions/1 or /my_transactions/1.json
  def update
    respond_to do |format|
      if @my_transaction.update(my_transaction_params)
        format.html do
          redirect_to category_my_transactions_url(category_id: @category.id, id: @my_transaction.id),
                      notice: 'My transaction was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @my_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_transactions/1 or /my_transactions/1.json
  def destroy
    # @category_my_transaction.destroy
    @category_my_transactions = CategoryMyTransaction.where(category_id: @category.id,
                                                            my_transaction_id: @my_transaction.id)

    @category_my_transactions.each(&:destroy)

    respond_to do |format|
      format.html do
        redirect_to category_my_transactions_url(category_id: @category.id),
                    notice: 'My transaction was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_my_transaction
    @my_transaction = MyTransaction.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_categories
    @categories = @user.categories
  end

  def set_category_my_transaction
    @category_my_transaction = CategoryMyTransaction.where(category_id: params[:category_id]).order(created_at: :desc)
  end

  # Only allow a list of trusted parameters through.
  def my_transaction_params
    params.require(:my_transaction).permit(:name, :amount, :category_ids, :user_id)
  end
end
