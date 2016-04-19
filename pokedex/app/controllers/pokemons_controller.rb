# app/controllers/pokemons_controller.rb

class PokemonsController < ApplicationController
	before_action :set_pokemon, only: [:show], :edit, :update]
	def index
		@pokemons = Pokemon.all
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
			redirect_to @pokemon
		else
			render 'edit'
		end
	end
end

private

def pokemon_params
	params.require(:pokemon).permit(:name)
end

def set_pokemon
	@pokemon = Pokemon.find params[:id]
end