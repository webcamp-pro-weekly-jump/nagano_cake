class Admins::GenresController < ApplicationController
	# before_action :authenticate_user!

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
		@genre.save!
		redirect_to admin_genres_path #仮です
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
		redirect_to admin_genres_path #仮です
	end

	private
	def genre_params
		params.require(:genre).permit(:name, :is_valid)
	end
end
