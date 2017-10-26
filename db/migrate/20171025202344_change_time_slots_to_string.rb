class ChangeTimeSlotsToString < ActiveRecord::Migration[5.0]
  def change
    change_column :restaurants, :time_slots, :string
  end
end
