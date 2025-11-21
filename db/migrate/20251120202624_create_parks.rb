class CreateParks < ActiveRecord::Migration[8.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.boolean :dog_friendly
      t.text :features

      t.timestamps
    end
  end
end
