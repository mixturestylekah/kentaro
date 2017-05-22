class RenameImageColumnToBlogs < ActiveRecord::Migration[5.1]
  def change
     rename_column :blogs, :image, :image_id
  end
end
