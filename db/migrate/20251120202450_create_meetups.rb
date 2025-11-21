class CreateMeetups < ActiveRecord::Migration[8.0]
  def change
    create_table :meetups do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.float :latitude
      t.float :longitude
      t.string :dog_size_pref
      t.string :dog_energy_pref
      t.references :organizer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
