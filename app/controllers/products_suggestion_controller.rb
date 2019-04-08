class ProductsSuggestionController < ApplicationController
    def index
    		if params[:query].present?
    			query = params[:query]
    			condition1 = "unaccent(lower(products.description)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
    			condition2 = condition1 + " OR unaccent(lower(brands.name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
    			@products = Product.joins(:brand).where(condition2)
    			@products.each do |product|
    				product.description = product.product_description
    			end
    		end
    		@products ||= Product.none

    		render json: @products
    	end
end
