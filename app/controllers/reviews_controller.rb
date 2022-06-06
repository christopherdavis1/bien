class ReviewsController < ApplicationController

    def index

        @number = rand(100)

        @reviews = Review.all

    end

    
    def new 
       # The form for adding a new review. 
        @review = Review.new 
    end

    
    def create 
        # Take info from the form and add it to the model
        @review = Review.new(form_params)

        # we want to check if the model can be saved
        # if it is, we're going to the homepage
        # if it isn't, show the new form

        if @review.save
            redirect_to root_path
        else
            # show the view for new.html.erb
            render "new"
        end

    end

    
    def show 
        #individual review page
        @review = Review.find(params[:id])
    end


    def destroy
        # find the individual review
        @review = Review.find(params[:id])

        # destroy the review
        @review.destroy

        # redirect to the homepage
        redirect_to root_path
    end


    def edit 
        # Find the individual review to edit
        @review = Review.find(params[:id])
    end

    
    def update 
        # Find the individual review
        @review = Review.find(params[:id])
       
        # Update with the new info from the form
        if @review.update(form_params)
       
            # Redirect somewhere new
            redirect_to review_path(@review)

        else
            render "edit"
        end
    end


    def form_params
        params.require(:review).permit(:title, :body, :score)
    end

end
