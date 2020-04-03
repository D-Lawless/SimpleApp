class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :about
      t.string :location
      t.datetime :start_dt
      t.datetime :end_dt
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
