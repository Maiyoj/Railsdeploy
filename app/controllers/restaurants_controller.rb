class RestaurantsController < ApplicationController
    
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end

    def create
        restaurant = Restaurant.create(restaurant_params)
        render json: restaurant, status: :created
    end

    def show
        restaurant = restaurant_find
        render json: restaurant, serializer:  RestaurantWithPizzaSerializer
    end

    def destroy
        restaurant = restaurant_find
        restaurant.destroy
        head :no_content 
    end

    private

    def restaurant_params
        params.permit(:name, :address)
    end
    
  
    def restaurant_find
        Restaurant.find(params[:id])
    end

    def  render_not_found_response
        render json: {error: "Restaurant Not Found"}, status: :not_found
    end
end
