class CreateSnapReactions < ActiveRecord::Migration[8.0]
  def change
    create_table :snap_reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :snap, null: false, foreign_key: true
      t.string :emoji

      t.timestamps
    end
  end
end
