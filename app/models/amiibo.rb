class Amiibo < ApplicationRecord
	belongs_to :game_series
	belongs_to :character
	belongs_to :amiibo_series
end
