class AddColumnToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :number_of_days, :integer
  end
end
