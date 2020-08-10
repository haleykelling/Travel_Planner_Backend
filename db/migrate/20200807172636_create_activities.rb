class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :details
      t.string :type_of_activity, default: 'General'
      t.string :address
      t.integer :start_time
      t.integer :end_time
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
