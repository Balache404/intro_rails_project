class CreateAmiibos < ActiveRecord::Migration[5.2]
  def change
    create_table :amiibos do |t|
      t.integer :series_id
      t.integer :character_id
      t.integer :game_id
      t.string :image
      t.string :name
      t.date :jp_release
      t.date :na_release
      t.string :type

      t.timestamps
    end
  end
end
