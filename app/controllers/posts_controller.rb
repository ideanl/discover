class PostsController < ApplicationController
  def new
		@post = Post.new	
  end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Post successfully create!"
		else
			flash.now[:danger] = "Post could not be created. Error: #{@user.errors.full_messages.join('. ')}"
			render 'new'
	end

	private
	def post_params
		params.require(:post).permit(:id, :body, :user_id)
	end
end
