class ChangeColoumnType < ActiveRecord::Migration
  def change
  	change_column :maps, :latitude, :float
  	change_column :maps, :longitude, :float
  end
end
