class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
