class CreateDifficulties < ActiveRecord::Migration
  def change
    create_table :difficulties do |t|
      
      t.integer :user_id        # User-Difficulty-Post M:N
      t.integer :post_id
      
      t.timestamps null: false
    end
  end
end
