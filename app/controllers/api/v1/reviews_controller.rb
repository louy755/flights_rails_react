module Api 
    module V1
        class ReviewsController < ApplicationController
            before_action :authenticate

      # POST /api/v1/reviews
      def create
        review = current_user.reviews.new(review_params)

        if review.save
          render json: serializer(review)
        else
          render json: errors(review), status: 422
        end
      end

      # DELETE /api/v1/reviews/:id
      def destroy
        review = current_user.reviews.find(params[:id])

        if review.destroy
          head :no_content
        else
          render json: errors(review), status: 422
        end
      end
            private 
            def review_params
                params.require(:review).permit(:title, :description, :score, :ariline_id)
            end

        end
    end
end