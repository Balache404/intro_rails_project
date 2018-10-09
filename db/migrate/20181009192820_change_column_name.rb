class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :amiibos, :type, :amiibo_type
  end
end
