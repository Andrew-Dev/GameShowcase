class GamesController < ApplicationController
	def index
		if current_user.game.present?
			@games = Game.where(code: current_user.game.code)
		end
		if current_user.is_admin == true
			@games = Game.all
		end
	end
	def new
		if user_signed_in?
			if current_user.game.present?
				redirect_to(edit_game_path(current_user.game))
			else
				@game = Game.new
			end
		else
			redirect_to('/')
		end
	end
	def create
		@game = Game.new(game_params)
		if @game.save
			@game.user = current_user
			@game.save
			redirect_to(@game)
		else
			errors = ""
			@game.errors.each do |e|
				errors = errors
			end
			flash[:danger] = @game.errors.full_messages.join("")
			render 'new'
		end
	end
	def show
		@game = Game.find(params[:id])
		@user = current_user
	end
	def edit
		if current_user.game
			@game = current_user.game
		else
			render 'new'
		end
	end
	def update
		@game = current_user.game
		@game.update(game_params)
		if @game.save
			redirect_to(@game)
		else
			render 'new'
		end
	end
	def destroy
		if current_user.game
			@game = Game.find(params[:id])
			if @game.user == current_user
				@game.comments.destroy_all
				@game.favorites.destroy_all
				@game.destroy
				redirect_to(games_path)
			end
		end
	end

	private
		def game_params
			params.require(:game).permit(:title,:description,:code,:main_screenshot,:file)
		end
end
