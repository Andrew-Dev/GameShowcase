class CommentsController < ApplicationController
	def create
		comment = Comment.new
		comment.user = current_user
		comment.game = Game.find(params[:game_id])
		comment.content = params[:content]
		if comment.save
			redirect_to(game_path(comment.game))
		else
			flash[:danger] = "Comment could not be saved."
			redirect_to(game_path(comment.game))
		end
	end
	def destroy
		comment = Comment.find(params[:id])
		game = comment.game
		if comment.user == current_user || game.user == current_user
			comment.destroy
		end
		redirect_to(game_path(game))
	end
end
