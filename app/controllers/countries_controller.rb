class CountriesController < ApplicationController
    before_action :authenticate_user
    before_action :set_country, only: [:show, :update, :destroy]

    def index 
        countries = current_user.countries.order(id: "asc")
        render json: countries
      end 
    
    def show 
       render json: @country
    end 

    def create 
      current_user.countries.create(country_params)
        if(country.save)
          render header: :created
        else 
          render json: {error: country.errors.full_messages}, status: :unprocessable_entity
        end
    end 

    def update 
        if @country.update(country_params)
          render status: :no_content
        else
            render json: {error: @trip.errors.full_messages}, status: :unprocessable_entity
        end
    end 

    def destroy
        @country.delete
        render status: :no_content
    end 

    private 

    def country_params 
        params.require(:country).permit(:name, :description, :airline, :year)
    end 

    def set_country 
        @country = Country.find(params[:id]) 
    end
end
