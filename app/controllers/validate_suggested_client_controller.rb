class ValidateSuggestedClientController < ApplicationController

    def index
        client = []

        if params[:client_name].present?
            client_name = params[:client_name]
            condition = "unaccent(lower(name)) = '#{I18n.transliterate(client_name.downcase)}'"
            client = Client.where(condition)
        end

        if !client.empty?
            result = [valid: true, id: clients.ids]
        else
            result = [valid: false, id: 0]
        end

        render json: result
    end
end
