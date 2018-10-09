class Amiibo < ApplicationRecord
	belongs_to :game_series
	belongs_to :character
	belongs_to :amiibo_series

	validates :series_id, :character_id, :game_id, :image, :type, :name, presence: true
end
