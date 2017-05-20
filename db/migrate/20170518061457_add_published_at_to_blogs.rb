class AddPublishedAtToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :published_at, :datetime
    add_column :blogs, :slug, :string
    add_index :blogs, :slug, unique: true
  end
end
