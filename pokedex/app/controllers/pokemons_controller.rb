# app/controllers/pokemons_controller.rb

class PokemonsController < ApplicationController
	before_action :set_pokemon, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new,:create]
	def index
		@pokemons = Pokemon.paginate(page: params[:page], per_page: 10)
					.includes(:type)
	end

	def show
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new pokemon_params
		if @pokemon.save
			redirect_to @pokemon
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@pokemon = set_pokemon
		if @pokemon.update pokemon_params
			flash[:success] = "Le pokemon #{@pokemon.name} a bien été mis  à jour."
			redirect_to @pokemon
		else
			render 'edit'
		end
	end

	def destroy
		@pokemon.destroy
		redirect_to pokemons_path
	end
end

private

def pokemon_params
	params.require(:pokemon).permit(:name, :level, :number, :health_points, :type_id, move_ids: [])
end

def set_pokemon
	@pokemon = Pokemon.find params[:id]
end