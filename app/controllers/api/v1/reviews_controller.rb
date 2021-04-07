module Api 
    module V1
        class ReviewsController < ApplicationController
            def create
                review = Review.new(reviews_params)

                if review.save 
                    ender json: ReviewSerializer.new(review).serialized_json
                else
                    render json: {error: airline.errors.message }, status: 422
                end   
            end
            def destroy
                review = Review.find_by(params[:id])

                if review.destroy
                    head :no_content
                else
                    render json: {error: airline.errors.message }, status: 422
                end   
            end

            private 
            def reviews_params
                params.require(:review).permit(:title, :description, :score, :ariline_id)
            end

        end
    end
end