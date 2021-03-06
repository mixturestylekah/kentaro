# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  description            :text(65535)
#  image_id               :string(255)
#  slug                   :string(255)      default(""), not null
#  name                   :string(255)
#  image_content_type     :string(255)
#

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :slug

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs, dependent: :destroy

  attachment :image

  validates :name,         presence: true
  validates :slug,         presence: true, uniqueness: true
  validates :description,  presence: true
end
