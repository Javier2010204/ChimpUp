class SaleDetailsController < ApplicationController
  before_action :set_sale, only: [:new, :create, :destroy]

  # GET /sale_details/new
  def new
    @sale_details = @sale.sale_details.build
    @sale_details.product = Product.first
  end

  def show
    #code
  end

  # POST /sale_details
  # POST /sale_details.json
  def create
    product_exists = false
    product_id = params[:sale_details][:product_id].to_i
    @sale.sale_details.each do |detail|
        if detail.product_id == product_id
            product_exists = true
            @sale_detail = detail
            @save_sale_detail = detail.id
            break
        end
    end
    if product_exists
        @sale_detail.qty += params[:sale_details][:qty].to_i
        @sale_detail.price = params[:sale_details][:price].to_f
        @sale_detail.save!
    else
        sale_detail = SaleDetail.new(sale_detail_params)
        if @sale.sale_details.last.nil?
            sale_detail.number = 1
        else
            sale_detail.number = @sale.sale_detils.last.number + 1
        end
        @sale.sale_details << sale_detail
    end
    @sale.save!
  end

  def edit
    @sale_detail = SaleDetail.find(params[:id])
  end

  # PATCH/PUT /sale_details/1
  # PATCH/PUT /sale_details/1.json
  def update
  end

  # DELETE /sale_details/1
  # DELETE /sale_details/1.json
  def destroy
    @sale_detail = SaleDetail.find(params[:id])
    @sale_detail.destroy

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
        @sale = Sale.find(params[:sale_id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_detail_params
      params.require(:sale_details).permit(:id,:sale_id, :product_id, :product_description, :number, :qty, :price, :_destroy)
    end
end
