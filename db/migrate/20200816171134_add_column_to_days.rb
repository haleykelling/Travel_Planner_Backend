class AddColumnToDays < ActiveRecord::Migration[6.0]
  def change
    add_column :days, :start_latitude, :float
    add_column :days, :start_longitude, :float
    add_column :days, :end_latitude, :float
    add_column :days, :end_longitude, :float
  end
end
