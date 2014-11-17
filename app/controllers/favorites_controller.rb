class FavoritesController < ApplicationController
	def create
		uservotes = Favorite.where("game_id = #{params[:game_id]} AND user_id = #{current_user.id}").count
		if uservotes == 0
			favorite = Favorite.new
			favorite.game = Game.find(params[:game_id])
			favorite.user = current_user
			favorite.save
			redirect_to(game_path(params[:game_id]))
		end
	end
	def destroy
		favorite = Favorite.where("game_id = #{params[:id]} AND user_id = #{current_user.id}").take
		favorite.destroy
		redirect_to(game_path(params[:id]))
	end
	def show
		@game = Game.find(params[:id])
		@favorites = Favorite.where("game_id = #{@game.id}")
	end
end
