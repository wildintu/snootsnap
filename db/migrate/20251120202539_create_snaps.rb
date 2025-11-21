class CreateSnaps < ActiveRecord::Migration[8.0]
  def change
    create_table :snaps do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meetup, null: false, foreign_key: true
      t.string :media
      t.string :text
      t.datetime :expires_at
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
