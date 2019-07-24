class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
      end

    def create
       @review =  current_user.reviews.create(params.require(:review).permit( :feedback, :rate ))
  
        if @review 
            redirect_to reviews_path
        else 
            redirect_to root_path
        end 
      end


      def destroy
        @review.destroy
        respond_to do |format|
          format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
          format.json { head :no_content }
        end
        
    end




      def edit
        puts params 
        @review = Review.find(params[:id])
      end


      def update
        review = Review.find(params[:id])
	    review.update(params.require(:review).permit(:username, :feedback, :rate))
	
	    redirect_to review
      end



    private

    def review_params
        params.require(:review).permit(:username,:feedback,:reate)
    end

end
