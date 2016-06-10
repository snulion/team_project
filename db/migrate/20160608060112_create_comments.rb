class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.string  :title                            # 노래 제목
      t.string  :content                          # 리플 내용
      t.string  :writer                           # 작성자
      t.boolean :published, default: true         # 삭제 관련
      t.integer :post_id                          # Post-Comment 1:N
      
      t.timestamps null: false
    end
  end
end
