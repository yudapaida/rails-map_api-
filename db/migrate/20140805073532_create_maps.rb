class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.text :latitude
      t.text :longitude

      t.timestamps
    end
  end
end
