class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.string :available_time
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
