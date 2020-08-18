class CreateAccomodations < ActiveRecord::Migration[6.0]
  def change
    create_table :accomodations do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
