class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.references :user, foreign_key: true
      t.integer "contact_id"

      t.timestamps
    end
  end
end
