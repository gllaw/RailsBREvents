class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :location
      t.references :state, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :states
    add_foreign_key :events, :users
  end
end
