class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.text :content
      t.integer :likes
      t.integer :user_id

      t.belongs_to :eventpost, foreign_key: true
      t.belongs_to :event, foreign_key: true


      t.timestamps
    end
    add_index :comments, :user_id
  end
end
