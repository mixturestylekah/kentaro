class AddSlugToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slug, :string,  null: false, default: ''
    add_column :users, :name, :string
  end
end
