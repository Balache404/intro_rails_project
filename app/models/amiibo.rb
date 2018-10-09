class Amiibo < ApplicationRecord
	belongs_to :game_series, foreign_key: "game_id"
	belongs_to :character, foreign_key: "character_id"
	belongs_to :amiibo_series, foreign_key: "series_id"

	validates :series_id, :character_id, :game_id, :image, :amiibo_type, :name, presence: true
end
