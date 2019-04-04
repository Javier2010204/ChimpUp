class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
      @company = current_user.company
      unsaved_sales = Sale.where(state: "draft", company_id: current_user.company.id)
    unsaved_sales.each do |sale|
        sale.destroy
    end
    @sales = @company.sales
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
      last_sale = Sale.where(state: "confirmed", user: current_user, company: current_user.company).maximum('number')
      number =  (last_sale != nil) ? last_sale + 1 : 1
      @sale = Sale.create(date: Date::current, number: number, state: "draft", user: current_user, company: current_user.company)
      @sale.sale_details.build
      params[:sale_id] = @sale.id.to_s
  end

  #comementarios

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:number, :date, :state, :user_id, :client_id, :company_id, sale_details_attributes: [:id, :sale_id, :product_id, :number, :qty, :price, :_destroy])
    end
end
