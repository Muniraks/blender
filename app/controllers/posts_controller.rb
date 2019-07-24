class PostsController < ApplicationController
    def index
        @post = Post.new
    end 

 
    def create
        @post = current_user.posts.create(params.require(:post).permit( :question, :answer_one, :answer_two, :answer_three ))
        @answers = [@post.answer_one, @post.answer_two, @post.answer_three]
        @answer = @answers.sample
    
        render "index", :alert => "your answer is #{@answer}"    
        
    end 



end
