class CreateTrustFeedbacks < ActiveRecord::Migration[8.0]
  def change
    create_table :trust_feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meetup, null: false, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
