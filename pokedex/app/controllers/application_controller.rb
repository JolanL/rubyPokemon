class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_minimum


  private 
  def check_minimum
  	count = Pokemon.count
  	limit = 10
  	flash[:danger] = "Moins de #{limit} Pokemons en base!" if count < limit
  end
end
