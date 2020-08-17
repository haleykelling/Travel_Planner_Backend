class AddColumnToTransportations < ActiveRecord::Migration[6.0]
  def change
    add_column :transportations, :latitude, :float
    add_column :transportations, :longitude, :float
  end
end
