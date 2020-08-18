class CreateDayAccomodations < ActiveRecord::Migration[6.0]
  def change
    create_table :day_accomodations do |t|
      t.references :day, null: false, foreign_key: true
      t.references :accomodation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
