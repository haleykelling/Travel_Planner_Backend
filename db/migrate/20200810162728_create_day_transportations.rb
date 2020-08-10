class CreateDayTransportations < ActiveRecord::Migration[6.0]
  def change
    create_table :day_transportations do |t|
      t.references :day, null: false, foreign_key: true
      t.references :transportation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
