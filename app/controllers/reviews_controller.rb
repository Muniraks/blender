class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
      end

    def create
       @review =  current_user.reviews.new(params.require(:review).permit( :feedback, :rate ))
        @review.username = current_user.email
        if @review.save 
            redirect_to reviews_path
        else 
            redirect_to root_path
        end 
      end


     
    def show 
        @review = Review.find(params[:id])
    end 




      def edit
        puts params 
        @review = Review.find(params[:id])
      end


      def update
        review = Review.find(params[:id])
	    review.update(params.require(:review).permit( :feedback, :rate))
	
	    redirect_to review_path(review)
      end


      def destroy
      @review = Review.find(params[:id]).destroy
      redirect_to reviews_path, notice: "Review has been deleted"
    end




    private

    def review_params
        params.require(:review).permit(:username,:feedback,:rate)
    end

end
