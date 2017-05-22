class AddColumnImageContentTypeToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :image_content_type, :string
  end
end
