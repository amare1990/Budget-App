class MyTransactionsController < ApplicationController
  before_action :set_my_transaction, only: %i[ show edit update destroy ]

  # GET /my_transactions or /my_transactions.json
  def index
    @my_transactions = MyTransaction.all
  end

  # GET /my_transactions/1 or /my_transactions/1.json
  def show
  end

  # GET /my_transactions/new
  def new
    @my_transaction = MyTransaction.new
  end

  # GET /my_transactions/1/edit
  def edit
  end

  # POST /my_transactions or /my_transactions.json
  def create
    @my_transaction = MyTransaction.new(my_transaction_params)

    respond_to do |format|
      if @my_transaction.save
        format.html { redirect_to my_transaction_url(@my_transaction), notice: "My transaction was successfully created." }
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
        format.html { redirect_to my_transaction_url(@my_transaction), notice: "My transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @my_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_transactions/1 or /my_transactions/1.json
  def destroy
    @my_transaction.destroy

    respond_to do |format|
      format.html { redirect_to my_transactions_url, notice: "My transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_transaction
      @my_transaction = MyTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_transaction_params
      params.require(:my_transaction).permit(:name, :amount, :user_id)
    end
end
