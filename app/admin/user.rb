ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :description, :image, :slug, :image_content_type

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :name
      row :description
      row :image_id
      row :created_at
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    inputs "ユーザー情報" do
      input :email
      input :password
      input :password_confirmation
      input :name
      input :slug
      attachment_field :image
      input :description
    end
    actions
  end
end
