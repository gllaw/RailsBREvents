class CreateJoinedEvents < ActiveRecord::Migration
  def change
    create_table :joined_events do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :joined_events, :users
    add_foreign_key :joined_events, :events
  end
end
