class AmiiboSeries < ApplicationRecord
	has_many :amiibos, foreign_key: "series_id"

	validates :name, presence: true
end
