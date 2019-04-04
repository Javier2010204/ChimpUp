class ClientsSuggestionController < ApplicationController

    def index
        if params[:query].present?
            query = params[:query]
            condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
            @clients = Client.where(condition)
        end

        @clients ||= Client.none

        render json: @clients
    end
end
