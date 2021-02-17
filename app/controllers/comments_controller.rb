class CommentsController < ApplicationController
	before_action :authenticate_user!

	def new
		@parent_comment = Comment.find(params[:comment_id])
		@comment = Comment.new
	end

	def create
		if params[:article_id]
			@parent = Article.find(params[:article_id])
		else
			@parent = Comment.find(params[:comment_id])
		end
		@comment = @parent.comments.new(comment_params)
		@comment.user = current_user
		if @comment.valid?
			@comment.save
		end
		# redirect_to @article
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end	
end
