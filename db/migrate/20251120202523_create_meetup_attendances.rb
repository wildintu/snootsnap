class CreateMeetupAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :meetup_attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :meetup, null: false, foreign_key: true
      t.datetime :joined_at

      t.timestamps
    end
  end
end
