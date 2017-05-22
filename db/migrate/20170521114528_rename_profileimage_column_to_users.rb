class RenameProfileimageColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :profileimage, :image_id
    add_column :users, :image_content_type, :string
  end
end
