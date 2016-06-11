class AddSingerToComments < ActiveRecord::Migration
  def change
    add_column :comments, :singer, :string
  end
end
