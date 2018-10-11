class AmiiboController < ApplicationController
	def about
	end

	def index
	end

	def list
		@amiibos = Amiibo.all
	end

	def show
		@amiibo = Amiibo.find(params[:id])
	end
end
