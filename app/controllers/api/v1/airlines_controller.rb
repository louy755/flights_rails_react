module Api 
    module V1
        class AirlinesController < ApplicationController
            def index 
                airlines = Airline.all

                render json: AirlineSerializer.new(airlines, options).serialized_json
            end

            def show 
                airline = Airline.find_by(slug: params[:slug])

                render json: AirlineSerializer.new(airline, options).serialized_json
            end

            def create
                airline = Airline.new(airlines_params)

                if airline.save 
                    ender json: AirlineSerializer.new(airline).serialized_json
                else
                    render json: {error: airline.errors.message }, status: 422
                end   
            end

            def  update
                airline = Airline.find_by(slug: params[:slug])

                if airline.update(airlines_params)
                    ender json: AirlineSerializer.new(airline, options).serialized_json
                else
                    render json: {error: airline.errors.message }, status: 422
                end
                 
            end

            def  destroy
                airline = Airline.find_by(slug: params[:slug])

                if airline.destroy
                    head :no_content
                else
                    render json: {error: airline.errors.message }, status: 422
                end
                 
            end

            private 
            def airlines_params
                params.require(:airline).permit(:name, :image_url)
            end

            def options 
                @options ||= { include: %i[reviews] }
            end
        end
    end
end