class StaticPagesController < ApplicationController
	def home
		if user_signed_in?
			redirect_to(games_path)
		end
	end
	def userlist
		if current_user && current_user.is_admin == true
			@users = User.all
		end
	end
end
