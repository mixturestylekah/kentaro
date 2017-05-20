# == Schema Information
#
# Table name: blogs
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  body         :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  image        :string(255)
#  description  :string(255)
#  published_on :date
#  status       :string(255)      default("0"), not null
#

class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [ :slugged, :history, :finders ]

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :user

  validates :user_id,     presence: true
  validates :title,       presence: true
  validates :body,        presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader

  scope :published, -> { where.not(published_at: nil) }
  scope :drafts, -> { where(published_at: nil) }

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.first_or_create_with_name!(name)
    end
    RelatedTagsCreator.create(self.tag_ids)
  end

  def self.tagged_with(name)
    Tag.find_by!(name: name).blogs
  end

  def related_blogs(size: 3)
    Blog.joins(:taggings).where.not(id: self.id).where(taggings: { tag_id: self.tag_ids }).distinct.published.limit(size).includes(:user)
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

  def self.new_draft_for(user)
    blog = self.new(user_id: user.id)
    blog.save_as_draft
    blog
  end

  def publish
    self.published_at = Time.zone.now
    self.slug = nil
    save
  end

  def save_as_draft
    self.published_at = nil
    self.slug ||= SecureRandom.urlsafe_base64
    save(validate: false)
  end

  def unpublish
    self.published_at = nil
  end
end
