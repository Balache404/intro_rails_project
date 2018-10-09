class CreateGameSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :game_series do |t|
      t.string :name

      t.timestamps
    end
  end
end
