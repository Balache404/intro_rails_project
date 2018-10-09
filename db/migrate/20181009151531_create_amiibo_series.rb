class CreateAmiiboSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :amiibo_series do |t|
      t.string :name

      t.timestamps
    end
  end
end
