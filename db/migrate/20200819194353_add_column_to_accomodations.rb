class AddColumnToAccomodations < ActiveRecord::Migration[6.0]
  def change
    add_column :accomodations, :reservation_number, :string
    add_column :accomodations, :phone_number, :string
  end
end
