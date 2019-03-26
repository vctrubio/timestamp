class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.float :latitude
      t.float :longitude
      t.datetime :start_time
      t.string :end_time
      t.string :picture
      t.references :user

      t.timestamps
    end
  end
end
