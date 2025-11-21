class CreateDogs < ActiveRecord::Migration[8.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :size
      t.string :energy_level
      t.string :temperament
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
