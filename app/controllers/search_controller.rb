class SearchController < ApplicationController
	def index
	end

	def results
		@amiibos = Amiibo.where('name LIKE ?', "%#{params[:q]}%")
	end
end
