class ValidateSuggestedProductController < ApplicationController
    def index
  		product = []
		if params[:product_description].present?
			product_description = params[:product_description]
			condition = "unaccent(lower(description || ' ' || name)) = '#{I18n.transliterate(product_description.downcase)}'"
			product = Product.joins(:brand).where(condition)
		end
		if !product.empty?
			result = [valid: true, id: product.first.id, price: product.first.price]
		else
			result = [valid: false, id: 0]
		end
		render json: result
  end
end
