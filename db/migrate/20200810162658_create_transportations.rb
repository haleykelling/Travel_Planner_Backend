class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string :name
      t.string :details
      t.string :type_of_activity
      t.string :address
      t.integer :start_time
      t.integer :end_time
      t.boolean :multiday

      t.timestamps
    end
  end
end
