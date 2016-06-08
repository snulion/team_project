class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      
      t.integer :user_id        # User-Like-Post M:N
      t.integer :post_id
      
      t.timestamps null: false
    end
  end
end
