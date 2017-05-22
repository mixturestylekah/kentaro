json.extract! @user,
  :id,
  :name,
  :image_id,
  :description,
  :created_at,
  :updated_at

json.image_url Refile.attachment_url(@user, :image)
