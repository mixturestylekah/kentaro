# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [ :slugged, :finders ]

  has_many :taggings, dependent: :destroy
  has_many :blogs,    through: :taggings

  has_many :tag_relationships, -> { order(relevance: :desc) }, dependent: :destroy
  has_many :related_tags, through: :tag_relationships, source: :related_tag

  validates :name, presence: true

  def self.first_or_create_with_name!(name)
    where(lowercase_name: name.strip.downcase).first_or_create! do |tag|
      tag.name = name.strip
    end
  end
end
