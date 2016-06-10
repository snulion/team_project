class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string  :genre
      t.text    :content
      t.string  :file_name, default: ""
      t.boolean :published, default: true
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
