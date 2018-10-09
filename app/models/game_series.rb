class GameSeries < ApplicationRecord
	has_many :amiibos, foreign_key: "game_id"

	validates :name, presence: true
end
