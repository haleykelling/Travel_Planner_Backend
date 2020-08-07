class CreateTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :transportations do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :start_time
      t.integer :end_time
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
