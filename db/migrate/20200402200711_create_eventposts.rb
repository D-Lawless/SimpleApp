class CreateEventposts < ActiveRecord::Migration[6.0]
  def change
    create_table :eventposts do |t|

      t.string :title
      t.text :content
      t.belongs_to :event, foreign_key: true
      t.integer :eventpost, :user_id
      
      t.timestamps
    end
    add_index :eventposts, :user_id
  end
end
