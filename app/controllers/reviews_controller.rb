class ReviewsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)

    if @review.save
      respond_to do |format|
        format.turbo_stream do
          @sorted_reviews = @movie.reviews.order(created_at: :desc) # Sort reviews by creation date

          render turbo_stream: [
            turbo_stream.update("reviews", partial: "reviews/review", collection: @sorted_reviews, as: :review)
            # Removed the line that replaces the new review form
          ]
        end
        format.html { redirect_to movie_path(@movie) } # Fallback for non-JS requests
      end
    else
      render json: { error: "Failed to save review" }, status: :unprocessable_entity # Handle error if saving fails
    end
  end

  private

  def review_params
    # Permit only rating and comment from the review form
    params.require(:review).permit(:rating, :comment)
  end
end
