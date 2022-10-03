class PizzasController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        pizzas = Pizza.all
        render json: pizzas
    end

    def create
        pizza = Pizza.create(pizza_params)
        render json: pizza, status: :created
    end

    private

    def pizza_params
        params.permit(:name, :ingredients)
    end

    def  render_not_found_response
        render json: {error: "Pizza Not Found"}, status: :not_found
    end



end
