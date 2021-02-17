module ArticlesHelper
	def my_article? article
		current_user and article.user_id == current_user.id
	end
end
