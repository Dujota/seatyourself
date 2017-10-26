class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.string :available_time, null: false
      t.integer :restaurant_id, null: false

      t.timestamps
    end
  end
end
