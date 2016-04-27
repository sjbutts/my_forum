class PostsController < ApplicationController
before_action :find_post, only: [:show, :edit, :update, :destroy]


	def index
		@posts = Post.all.order("created_at DESC")
	end
	
	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params) #creating posts based on the passed attributes

		if @post.save
			redirect_to @post #go to post show page
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

private
	def find_post
		@post = Post.find(params[:id])	#showing the post that matches the id. must create show view in order for post to show. Definiing it here to not have to repeat it in the other  methods
	end

	def post_params #defining post parameters
		params.require(:post).permit(:title, :content)  #requiring posts and permitting attributes
	end
end
