class CreateEventposts < ActiveRecord::Migration[6.0]
  def change
    create_table :eventposts do |t|

      t.string :title
      t.text :content
      t.integer :likes
      t.integer :user_id


      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
    add_index :eventposts, :user_id
  end
end
